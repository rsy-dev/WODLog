# Home adaptive banner

The home screen has one anchored adaptive banner below the workout list, outside
its scroll view. It reserves 24 logical pixels above and 32 pixels plus the shell's
bottom inset below, separating it from workout controls and the floating tabs.
It is hidden on short screens (under 600 logical pixels), narrow layouts (under
360), while the keyboard is open, and on inactive navigation branches. Width or
orientation changes dispose the old ad and request a newly sized one. Until an ad
loads, or after load failure, its slot occupies no space. Ads never gate logging.

## Safe defaults

Only Android and iOS **debug** builds request Google's dedicated test ads.
`flutter run --dart-define=ADMOB_TEST_ADS=false` disables them for local QA.
Profile/release, web and desktop builds do not initialize or request ads.
There is deliberately no production ID override or live-ad activation switch.
The checked-in native app IDs and Dart banner IDs are Google's public samples,
not credentials. Do not replace them merely to test ads; never click live ads.

## Account setup needed before live monetization

1. In AdMob, register Android package `dev.rsy.wodlog` and the iOS app with bundle
   ID `dev.rsy.wodlog`. Supply each platform's app ID (`ca-app-pub-…~…`).
2. Create one **banner** ad unit for each platform. Supply each unit ID
   (`ca-app-pub-…/…`). App IDs and ad unit IDs are different values.
3. Configure and publish the required messages in **Privacy & messaging** for
   the app's audience/regions, including European regulations and applicable US
   states. Supply the public privacy-policy URL and confirm audience/age settings.
   If iOS tracking is intended, configure the applicable ATT message/usage text;
   this change neither requests ATT nor assumes tracking authorization.
4. Complete AdMob app/store verification and app-ads.txt setup when requested by
   the account. No Firebase project, service account, or billing API key is needed
   for this banner integration.

Live ads remain disabled pending that configuration **and a reviewed activation
change**: wire actual native app IDs and platform banner IDs together, update
consent information on each launch, present UMP forms when required, check
`canRequestAds()` before SDK initialization/ad requests, and provide a visible
privacy-options entry point when UMP requires it. Test consent grant/refusal,
withdrawal, errors and regional messages using registered test devices. Update
store privacy disclosures and the privacy policy for the actual configuration.
Do not claim the current test-only implementation is production-consent-ready.

## Verification

Run `flutter analyze`, `flutter test`, Android debug and iOS simulator builds,
and `flutter build web`. On each mobile simulator, confirm a Google **Test Ad**
loads, stays separate from tabs, disappears on other tabs/keyboard/landscape,
and returns without duplicates. Disable connectivity to check that workouts
remain usable without an ad. Automated tests cover the platform/build gates,
SDK load exceptions, resize disposal and inactive/keyboard/short-screen handling.
Builds and simulator installs are local only; no release workflow is triggered.

## Official references

- [Flutter SDK setup](https://developers.google.com/admob/flutter/quick-start)
- [Adaptive banners and test unit IDs](https://developers.google.com/admob/flutter/banner)
- [UMP and privacy options](https://developers.google.com/admob/flutter/privacy)
- [Google Flutter SDK source](https://github.com/googleads/googleads-mobile-flutter)

The resolved plugin is `google_mobile_ads` 9.2.0. Its public API recommends
`getLargeAnchoredAdaptiveBannerAdSize` over the deprecated current-orientation
method; both size to the available width rather than using a fixed 320×50 slot.
