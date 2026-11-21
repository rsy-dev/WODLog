# Issue #37 follow-up verification

Implements [review comment 7061791484](https://github.com/rsy-dev/WODLog/issues/37#issuecomment-7061791484) on PR #38, from baseline `f0dce582bdd9dd83988b5cd9d1d97ff3ab05e9cb`.

## Changes and visual comparison

| Screen | Before | After | Observed change |
| --- | --- | --- | --- |
| Home | [Baseline](../home-android-final.png) | [Current](home.png) | Shared WOD row has blue type marker, stored format/standard, bold right-aligned score. |
| Records | [Baseline](../records-android-final.png) | [Current](records.png) | Brand header, large Workout log heading, new WOD action; search and type chips grouped in one surface. |
| Stats | [Baseline](../stats-android-final.png) | [Current](stats.png) | Large heading, WOD selector, right-aligned history scores; movement group section remains visible without data. |
| Settings | [Baseline](../settings-android-final.png) | [Current](settings.png) | Language/goal values on right; selected unit uses navy on blue. Large text stacks language/goal values. |
| Editor | [Baseline](../editor-android-final.png) | [Current](editor.png) | Secondary actions use 48dp minimum touch targets; prescription precedes movement list and + Exercise action. Fixed save remains separate from scrolling fields. |

Fixed mock references: [records](../records-mock-english-393.png), [stats](../stats-mock-english-393.png), [settings](../settings-mock-english-393.png). These are hierarchy/style comparisons, not pixel-identical goldens: app captures include Android system bars, native controls, and real database records. Unconfirmed standards deliberately stay Unconfirmed instead of copying the mock's Rx label. PR eligibility and backend/storage contracts are unchanged.

## Verification

- `flutter analyze`: no issues.
- `flutter test`: all 64 tests passed, including 24 locale layouts at 320x640 / 1.3 text scale and Korean 2x editor coverage.
- Added assertions for Records → new WOD → save → detail, stored unknown standard display, and Stats WOD selection/reset. Updated scroll targeting for relocated controls; no assertions removed.
- `flutter build apk --debug --no-pub`: passed. Temporary Java 18 override restored afterward.
- `flutter build ios --simulator --no-codesign --no-pub`: passed; no additional iOS simulator capture retries.
- Android Pixel 3a API 33: Records → Log a WOD → name Followup → 06:15 → Save opened [detail with 6:15](saved-detail.png), retaining Unconfirmed. [Keyboard capture](keyboard.png) shows time input with fixed Save visible. Initial adb text injection dropped the first digit; corrected input and verified saved value rather than treating the failed injection as success.
- `git diff --check`: passed.

The screenshots were captured from the debug APK. Release signing, distribution, and iOS runtime visual acceptance remain with the coordinator. This work does not merge PR #38 or close issue #37.
