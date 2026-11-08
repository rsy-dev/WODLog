# Android first release and monetization

Android on Google Play is the first release target. The app stays local-first;
ads are a later milestone after workout recording is reliable.

## Before development reaches release testing

- [ ] Choose a Play Console account type (personal or organization) and finish account verification.
- [ ] Keep `dev.rsy.wodlog` as the Android application ID once the first store build is published.
- [ ] Create and securely back up the Android upload key outside this repository.
- [ ] Prepare the store name, descriptions, icon, screenshots, support contact, and privacy-policy URL.
- [ ] Decide the initial countries and review the store listing and privacy policy for those locales.
- [ ] Complete Play Console app-content, target-audience, ads, content-rating, and Data safety declarations.
- [ ] Confirm the current target API requirement when preparing the release build.
- [ ] Recruit closed-test users when the Play Console account's rules require them.

## Ads milestone (after the recording MVP)

- [ ] Confirm the AdMob account and the publisher ID before creating production ad units.
- [ ] Add the app to AdMob, link the Play listing, complete app-readiness review, and verify `app-ads.txt`.
- [ ] Complete AdMob payee, identity, address, bank, and applicable tax setup.
- [ ] Choose ad formats and locations. Ads must not interrupt session, exercise, or set entry.
- [ ] Add Google Mobile Ads and consent handling behind a small app-level adapter.
- [ ] Use Google's test app/ad unit IDs during development; keep production IDs out of source control where practical.
- [ ] Update the privacy policy and Play Data safety / ads declarations to match the final SDK behavior.
- [ ] Review the ad and consent flow in each launch locale before production release.

## Localization currently shipped in the app

The UI follows the device locale for Arabic, Bengali, Dutch, English, Filipino,
French, German, Hindi, Indonesian, Italian, Japanese, Korean, Polish,
Portuguese, Russian, Spanish, Thai, Turkish, Urdu, Vietnamese, and Chinese
(Simplified and Traditional). Chinese script is resolved from the locale, with
Taiwan, Hong Kong, and Macao defaulting to Traditional Chinese. Unsupported
languages fall back to English. Dates, number entry, and number display use
locale data.

Before publishing a locale, review its translations with a fluent speaker and
review store listing, privacy, and support text separately. New translations
belong in `lib/l10n/app_<locale>.arb`; avoid adding user-facing strings directly
to Dart widgets.
