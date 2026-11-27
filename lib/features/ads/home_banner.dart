import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

/// No production ad path until real app/unit IDs and consent are configured.
String? testBannerUnit({
  required TargetPlatform platform,
  required bool web,
  required bool debug,
  required bool enabled,
}) {
  if (web || !debug || !enabled) return null;
  return switch (platform) {
    TargetPlatform.android => 'ca-app-pub-3940256099942544/9214589741',
    TargetPlatform.iOS => 'ca-app-pub-3940256099942544/2435281174',
    _ => null,
  };
}

/// One anchored banner below the home content, outside the scrolling controls.
class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final unit = testBannerUnit(
      platform: defaultTargetPlatform,
      web: kIsWeb,
      debug: kDebugMode,
      enabled: const bool.fromEnvironment('ADMOB_TEST_ADS', defaultValue: true),
    );
    // Inactive navigation branches must not keep refreshing invisible ads.
    if (unit == null ||
        !TickerMode.valuesOf(context).enabled ||
        MediaQuery.viewInsetsOf(context).bottom > 0 ||
        MediaQuery.sizeOf(context).height < 600) {
      return const SizedBox.shrink();
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        if (!constraints.hasBoundedWidth) return const SizedBox.shrink();
        final width = (constraints.maxWidth - 40).floor();
        if (width < 320) return const SizedBox.shrink();
        return _Banner(
          key: ValueKey((unit, width, MediaQuery.orientationOf(context))),
          unit: unit,
          width: width,
        );
      },
    );
  }
}

class _Banner extends StatefulWidget {
  const _Banner({required this.unit, required this.width, super.key});
  final String unit;
  final int width;

  @override
  State<_Banner> createState() => _BannerState();
}

class _BannerState extends State<_Banner> {
  static Future<InitializationStatus>? _initialization;
  static bool _initialized = false;
  BannerAd? _ad;
  bool _loaded = false;

  @override
  void initState() {
    super.initState();
    unawaited(_load());
  }

  Future<void> _load() async {
    try {
      if (!_initialized) {
        await (_initialization ??= MobileAds.instance.initialize());
        _initialized = true;
      }
      if (!mounted) return;
      final size = await AdSize.getLargeAnchoredAdaptiveBannerAdSize(
        widget.width,
      );
      if (!mounted || size == null || size.height <= 0) return;
      final ad = BannerAd(
        adUnitId: widget.unit,
        size: size,
        request: const AdRequest(),
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            if (!mounted || !identical(ad, _ad)) return;
            setState(() => _loaded = true);
          },
          onAdFailedToLoad: (ad, error) {
            if (!mounted || !identical(ad, _ad)) return;
            _removeAd();
            setState(() => _loaded = false);
          },
        ),
      );
      _ad = ad;
      await ad.load();
    } catch (_) {
      if (!_initialized) _initialization = null;
      // Ads never block local workout logging, including plugin/network errors.
      if (mounted) {
        _removeAd();
        setState(() => _loaded = false);
      }
    }
  }

  void _removeAd() {
    final ad = _ad;
    _ad = null;
    if (ad != null) unawaited(ad.dispose().catchError((Object _) {}));
  }

  @override
  void dispose() {
    _removeAd();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ad = _ad;
    if (!_loaded || ad == null) return const SizedBox.shrink();
    return Padding(
      // Shell extends under its floating tabs; reserve that full inset too.
      padding: EdgeInsets.fromLTRB(
        20,
        24,
        20,
        32 + MediaQuery.paddingOf(context).bottom,
      ),
      child: Center(
        heightFactor: 1,
        child: SizedBox(
          width: ad.size.width.toDouble(),
          height: ad.size.height.toDouble(),
          child: AdWidget(ad: ad),
        ),
      ),
    );
  }
}
