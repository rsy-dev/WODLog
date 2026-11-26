# WODLog Mobile Testing and Distribution

**Updated:** 2026-11-26

## iPhone testing at work

The no-cost preview is a static Flutter web app hosted on GitHub Pages. It has no WODLog API or workout-data server. After deployment:

1. Open `https://rsy-dev.github.io/WODLog/` in iPhone Safari.
2. Tap Share → **Add to Home Screen**.
3. Launch WODLog from the new Home Screen icon.

Workout records are stored in the Safari browser database on that iPhone. They are separate from the native iOS/Android app and do not sync. Clearing Safari site data can remove them. The app needs internet to load or update the web files.

Run **Deploy web preview** manually from GitHub Actions when a web deployment is requested. Select `main`, `develop`, or `master`. The selected branch must contain the workflow and be allowed by the `github-pages` environment. The branches share one URL, so the last successful deployment supplies the preview. After the workflow succeeds, reload Safari or close and reopen the Home Screen app. The same HTTPS address works over Wi-Fi or mobile data and preserves the site's local records.

## Native iPhone testing

- Xcode installed the Release build on the connected iPhone 15 Pro using the free Personal Team. The installed app can launch from the Home Screen without keeping the Mac connected.
- Each new native version must be signed and installed again through Xcode. Free Personal Team provisioning expires after seven days.
- TestFlight remains a later option after Apple Developer Program activation and App Store Connect setup.

### Handing off an iOS simulator build

Release shares the source commit, the path to the `iphonesimulator` app built from it, and the version and build number from that app’s `Info.plist`. Name the QA simulator by UDID so the tester can select the same installation when several simulators have similar names.

Before recording a result, install that exact artifact on the designated QA simulator and launch it. With its UDID in `sim_udid`, check the installed app:

```sh
app_path=$(xcrun simctl get_app_container "$sim_udid" dev.rsy.wodlog app)
/usr/libexec/PlistBuddy -c 'Print CFBundleShortVersionString' "$app_path/Info.plist"
/usr/libexec/PlistBuddy -c 'Print CFBundleVersion' "$app_path/Info.plist"
```

Record the observed version, build number and source commit with the tested flow. If the artifact is for a physical device, the installed values differ, or launch fails, leave the flow unverified and report the missing artifact or observed mismatch in the handoff.

## Android testing

- Build a signed release APK and attach it to a GitHub Release for direct Galaxy installation.
- The Android workflow requires a dedicated keystore and GitHub Actions secrets.
- Keep Play Store AAB signing and publication as a separate store-release step.

## Data storage

- Native builds use a local SQLite database in the app's private storage.
- The web preview uses Drift WebAssembly storage in the browser's local site data.
- Workout records are not sent to an application server. Native and web preview data are separate.
