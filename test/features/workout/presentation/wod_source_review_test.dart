import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wodlog/features/workout/data/wod_prescription.dart';
import 'package:wodlog/features/workout/presentation/wod_source_review_sheet.dart';
import 'package:wodlog/l10n/generated/app_localizations.dart';

void main() {
  testWidgets('reviews and applies only the selected official WOD level', (
    tester,
  ) async {
    const source =
        'Every minute on the minute for 15 minutes complete:\n'
        'Minute 1: 20 wall-ball shots\n'
        'Intermediate option:\nE2MOM 12 min\nMinute 1: 15 box jumps\n'
        'Beginner option:\n4 rounds for time of:\n400-meter run';
    final l10n = lookupAppLocalizations(const Locale('en'));
    WodPrescription? applied;
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        home: Scaffold(
          body: Builder(
            builder: (context) => TextButton(
              onPressed: () async {
                applied = await showWodSourceReview(
                  context,
                  title: 'Daily WOD',
                );
              },
              child: const Text('Paste workout'),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Paste workout'));
    await tester.pumpAndSettle();
    await tester.enterText(
      find.widgetWithText(TextField, l10n.wodSourceText),
      source,
    );
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(OutlinedButton, l10n.reviewWodText));
    await tester.pumpAndSettle();
    expect(find.text(l10n.applyWodSource), findsNothing);

    final list = find
        .descendant(
          of: find.byType(ListView),
          matching: find.byType(Scrollable),
        )
        .first;
    final intermediate = find.widgetWithText(ChoiceChip, 'Intermediate option');
    await tester.scrollUntilVisible(intermediate, 100, scrollable: list);
    await tester.tap(intermediate);
    await tester.pumpAndSettle();
    expect(find.text('Wall Ball'), findsNothing);
    expect(find.text('Run'), findsNothing);
    await tester.scrollUntilVisible(
      find.text('Box Jump'),
      100,
      scrollable: list,
    );
    final apply = find.widgetWithText(FilledButton, l10n.applyWodSource);
    await tester.scrollUntilVisible(apply, 100, scrollable: list);
    await tester.tap(apply);
    await tester.pumpAndSettle();

    expect(applied?.title, 'Daily WOD');
    expect(applied?.structure, WodStructure.emom);
    expect(applied?.intervalSeconds, 120);
    expect(applied?.intervalCount, 6);
    expect(applied?.movements.single.movementId, 'box_jump');
    expect(applied?.rawText, source);
  });
}
