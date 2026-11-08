# Photo to WOD Record: OCR Feature Proposal

**Date:** 2026-11-08  
**Status:** Proposed next feature  
**Product:** WODLog

## Goal

Let a user take or select a photo of today's workout, extract its text, turn common WOD patterns into an editable workout draft, and save only after the user reviews it.

## User flow

1. Choose camera or photo library.
2. Preview the image and adjust crop or rotation.
3. Run on-device OCR and show the recognized source text.
4. Parse common workout patterns into a structured draft.
5. Let the user correct uncertain movements, reps, weights, units, and result fields.
6. Save the confirmed draft to the existing local workout/session records.

OCR must not directly commit a workout. The app should keep the source text available while editing and discard the image/draft if the user exits without saving.

## Technical direction

- Use Flutter `image_picker` for camera and gallery input.
- Prefer on-device OCR to support offline use and keep workout photos off a server.
- Put OCR behind a platform adapter. Android ML Kit and Apple Vision are candidates; validate Korean and Latin recognition on both platforms before choosing implementation details.
- The current community Flutter ML Kit bridge documents iOS Latin-only support, so it cannot be assumed to provide Korean parity across platforms.
- For a still photo, use image handling rather than video processing. Start with orientation correction and user-controlled crop/rotate. Add resize, contrast, or perspective correction only if photo evaluation shows a need.
- Photo focus and character size affect recognition. Give recapture guidance for blurry or distant text.
- Keep OCR separate from workout parsing. OCR reads text and layout; a domain parser maps text into AMRAP, For Time, EMOM, movements, reps, load, units, and score.
- Use a repository transaction when saving parsed data so a failure cannot leave a partial workout.

## Staged delivery

1. Photo picker, preview, orientation/crop, and raw OCR text.
2. Parser for common WOD formats with an editable draft and warnings for uncertain or missing fields.
3. Localized exercise vocabulary and representative photo evaluation across scripts and layouts.
4. Consider optional cloud OCR for handwriting or unsupported cases only after explicit opt-in, credential isolation, and retention/deletion behavior are designed.

## Likely code areas

- `lib/features/workout/data/wod_ocr_service.dart`: platform OCR adapter.
- `lib/features/workout/data/wod_parser.dart`: deterministic parser, independent of Flutter UI.
- `lib/features/workout/providers/wod_import_provider.dart`: import and draft state.
- `lib/features/workout/presentation/wod_photo_import_screen.dart`: image preview, raw OCR, editable confirmation.
- `lib/app/app.dart`: import route.
- Existing session and WOD repositories: transactional persistence of confirmed data.
- All `lib/l10n/app_*.arb` files: localized controls and status messages.

## Risks and decisions to validate

- Gym whiteboards contain shorthand, handwriting, varied layouts, and low-quality photos. Recognition alone cannot reliably infer workout meaning.
- Reps, load, and units can be misread; uncertain values must be reviewed before saving.
- Platform OCR language support differs. Verify Korean and Latin on current supported OS versions and physical devices.
- Do not upload photos or recognized text to a cloud service without a clear opt-in and privacy disclosure.
- Build an evaluation set from consented, varied example images before claiming broad layout or language support.

## Official references

- [Google ML Kit Text Recognition v2](https://developers.google.com/ml-kit/vision/text-recognition/v2)
- [ML Kit supported languages](https://developers.google.com/ml-kit/vision/text-recognition/v2/languages)
- [Flutter ML Kit Text Recognition bridge and platform constraints](https://pub.dev/packages/google_mlkit_text_recognition)
- [Apple Vision text recognition](https://developer.apple.com/documentation/vision/recognizing-text-in-images)
- [Flutter image_picker](https://pub.dev/packages/image_picker)
- [Android Photo Picker](https://developer.android.com/training/data-storage/shared/photo-picker)
