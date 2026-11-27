import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
// The SDK's channel uses a custom codec, required to simulate native callbacks.
// ignore: implementation_imports
import 'package:google_mobile_ads/src/ad_instance_manager.dart';
import 'package:wodlog/features/ads/home_banner.dart';

void main() {
  test('only debug mobile builds can request Google test inventory', () {
    for (final platform in TargetPlatform.values) {
      for (final web in [false, true]) {
        for (final debug in [false, true]) {
          for (final enabled in [false, true]) {
            final unit = testBannerUnit(
              platform: platform,
              web: web,
              debug: debug,
              enabled: enabled,
            );
            final allowed =
                !web &&
                debug &&
                enabled &&
                [TargetPlatform.android, TargetPlatform.iOS].contains(platform);
            expect(unit != null, allowed);
            if (unit != null) {
              expect(unit, startsWith('ca-app-pub-3940256099942544/'));
            }
          }
        }
      }
    }
  });

  final calls = <MethodCall>[];
  var failLoad = false;
  var adaptiveHeight = 50;
  final channel = MethodChannel(
    'plugins.flutter.io/google_mobile_ads',
    StandardMethodCodec(AdMessageCodec()),
  );
  TestWidgetsFlutterBinding.ensureInitialized();
  setUp(() {
    calls.clear();
    failLoad = false;
    adaptiveHeight = 50;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async {
          calls.add(call);
          switch (call.method) {
            case 'MobileAds#initialize':
              return InitializationStatus(<String, AdapterStatus>{});
            case 'AdSize#getLargeAnchoredAdaptiveBannerAdSize':
              return adaptiveHeight;
            case 'loadBannerAd':
              if (failLoad) throw PlatformException(code: 'offline');
          }
          return null;
        });
  });
  tearDown(() {
    debugDefaultTargetPlatformOverride = null;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  Widget host({
    double width = 400,
    double height = 800,
    bool active = true,
    double keyboard = 0,
  }) => MaterialApp(
    home: MediaQuery(
      data: MediaQueryData(
        size: Size(width, height),
        viewInsets: EdgeInsets.only(bottom: keyboard),
      ),
      child: TickerMode(
        enabled: active,
        child: Align(
          alignment: Alignment.topLeft,
          child: SizedBox(width: width, child: const HomeBanner()),
        ),
      ),
    ),
  );

  testWidgets('unsupported and hidden contexts never call the SDK', (
    tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.linux;
    await tester.pumpWidget(host());
    await tester.pump();
    expect(calls, isEmpty);
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    for (final widget in [
      host(active: false),
      host(keyboard: 300),
      host(height: 400),
      host(width: 320),
    ]) {
      await tester.pumpWidget(widget);
      await tester.pump();
      expect(calls, isEmpty);
    }
    debugDefaultTargetPlatformOverride = null;
  });

  testWidgets('zero-height adaptive size skips the ad request', (tester) async {
    adaptiveHeight = 0;
    await tester.pumpWidget(host());
    await tester.pumpAndSettle();
    expect(
      calls.map((call) => call.method),
      contains('AdSize#getLargeAnchoredAdaptiveBannerAdSize'),
    );
    expect(calls.where((call) => call.method == 'loadBannerAd'), isEmpty);
    expect(tester.getSize(find.byType(HomeBanner)).height, 0);
  });

  testWidgets('load exception collapses slot and disposes the ad', (
    tester,
  ) async {
    failLoad = true;
    await tester.pumpWidget(host());
    await tester.pumpAndSettle();
    expect(calls.where((c) => c.method == 'loadBannerAd'), hasLength(1));
    expect(calls.where((c) => c.method == 'disposeAd'), hasLength(1));
    expect(find.byType(AdWidget), findsNothing);
    expect(tester.getSize(find.byType(HomeBanner)).height, 0);
    expect(tester.takeException(), isNull);
  });

  testWidgets('resize and inactive tab dispose pending ads', (tester) async {
    await tester.pumpWidget(host());
    await tester.pumpAndSettle();
    final first = calls.lastWhere((c) => c.method == 'loadBannerAd');
    expect(
      first.arguments['adUnitId'],
      'ca-app-pub-3940256099942544/9214589741',
    );
    await tester.pumpWidget(host(width: 500));
    await tester.pumpAndSettle();
    expect(calls.where((c) => c.method == 'loadBannerAd'), hasLength(2));
    expect(calls.where((c) => c.method == 'disposeAd'), hasLength(1));
    await tester.pumpWidget(host(active: false));
    await tester.pumpAndSettle();
    expect(calls.where((c) => c.method == 'disposeAd'), hasLength(2));
    expect(tester.takeException(), isNull);
  });
}
