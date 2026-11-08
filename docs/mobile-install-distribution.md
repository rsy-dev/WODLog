# WODLog Mobile Testing and Distribution

**Updated:** 2026-11-09

## iPhone testing at work

The no-cost preview is a static Flutter web app hosted on GitHub Pages. It has no WODLog API or workout-data server. After deployment:

1. Open `https://rsy-dev.github.io/WODLog/` in iPhone Safari.
2. Tap Share → **Add to Home Screen**.
3. Launch WODLog from the new Home Screen icon.

Workout records are stored in the Safari browser database on that iPhone. They are separate from the native iOS/Android app and do not sync. Clearing Safari site data can remove them. The app needs internet to load or update the web files.

GitHub Actions builds the web app from `main` and deploys static files to Pages. No signing secret or app server is needed.

## Native iPhone testing

- Xcode installed the Release build on the connected iPhone 15 Pro using the free Personal Team. The installed app can launch from the Home Screen without keeping the Mac connected.
- Each new native version must be signed and installed again through Xcode. Free Personal Team provisioning expires after seven days.
- TestFlight remains a later option after Apple Developer Program activation and App Store Connect setup.

## Android testing

- Build a signed release APK and attach it to a GitHub Release for direct Galaxy installation.
- The Android workflow requires a dedicated keystore and GitHub Actions secrets.
- Keep Play Store AAB signing and publication as a separate store-release step.

## Data storage

- Native builds use a local SQLite database in the app's private storage.
- The web preview uses Drift WebAssembly storage in the browser's local site data.
- Workout records are not sent to an application server. Native and web preview data are separate.
