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

- Xcode is present but its first-launch components are incomplete.
- CocoaPods is not installed; check whether the current Flutter iOS Swift Package Manager setup can resolve every plugin before adding CocoaPods.
- No signing identities or provisioning profiles are available, and no iPhone is connected to the Mac.
- Next local preparation: finish Xcode first launch, install/resolve iOS dependencies, sign in to Xcode with the Apple Account, connect and trust the iPhone, then install a development build. For a reusable tap-to-install link, enroll in Apple Developer Program and set up TestFlight.

## Release artifacts

- Galaxy: GitHub Release page with a directly downloadable APK.
- iPhone: TestFlight public or invitation link after signing and upload.
- No workout database, API, or app backend is required for either route.
