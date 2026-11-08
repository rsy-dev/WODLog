# WODLog Mobile Install Plan

**Updated:** 2026-11-08

## Product direction

- Keep workout data on the phone. The app does not need a WODLog account or application server.
- Ship native Android and iOS builds. The web build is not the install route: the current database opens SQLite through `dart:io` and `NativeDatabase`; web would need a separate Drift WebAssembly database setup.
- Keep screens focused on starting a workout, entering sets or WOD results, and opening history. Avoid a dashboard, decorative metrics, and nonfunctional navigation.

## Android

- Build a release APK for direct installation on Galaxy devices.
- Host the APK as a GitHub Release asset. This hosts the installer only; workout data remains local.
- Keep Play Store AAB signing and publishing as a separate store-release step.

## iPhone

- A tap-to-install tester link should use TestFlight. Upload a signed build to App Store Connect, then provide the TestFlight invitation link.
- TestFlight requires Apple Developer Program membership and App Store Connect setup.
- A free Apple Account can install a development build from Xcode to a connected personal iPhone, but this is a cable-and-computer workflow and its development provisioning expires after seven days. It does not provide a durable web install link.
- Do not distribute an unsigned IPA; iOS will not install it as an app.

## Current machine readiness

- `flutter build ios --no-codesign` succeeds and produces a device build at `build/ios/iphoneos/Runner.app`.
- The current Xcode project resolves dependencies using Swift Package Manager; CocoaPods is not installed, but it did not block this build.
- No signing identities or provisioning profiles are available, and no iPhone is connected to the Mac.
- The Apple Developer Program enrollment is complete; TestFlight and App Store Connect app setup, signing, and upload remain.
- Next preparation: create the App Store Connect app record for bundle ID `dev.rsy.wodlog`, configure secure signing/upload credentials, then upload a beta build and create the tester invitation link. Do not send signing keys or passwords in chat.

## Release artifacts

- Galaxy: GitHub Release page with a directly downloadable APK.
- iPhone: TestFlight public or invitation link after signing and upload.
- No workout database, API, or app backend is required for either route.
