# Android Test APK Release

The workflow in `.github/workflows/android-apk-release.yml` builds a signed APK and attaches it to a GitHub Release when a tag matching `android-v*` is pushed. The APK is a sideloadable phone-test build; it does not publish to Google Play and it does not add an app data server.

## One-time signing setup

Create a dedicated Android test signing keystore and keep the file and passwords private. Do not commit the keystore or `android/key.properties`.

Add these repository Actions secrets in GitHub under **Settings → Secrets and variables → Actions**:

- `ANDROID_KEYSTORE_BASE64`: base64-encoded contents of the keystore file
- `ANDROID_KEY_ALIAS`: alias created for the keystore
- `ANDROID_KEY_PASSWORD`: password for the key
- `ANDROID_STORE_PASSWORD`: password for the keystore

Encode the keystore locally before pasting its contents into the GitHub secret field. For example, on macOS:

```sh
base64 < wodlog-test.jks | tr -d '\n'
```

Keep the keystore and both passwords in a private password manager or secure backup. Never paste them into an issue, commit, or chat message.

The workflow writes these values into temporary ignored files only for the build and removes the files at the end of the job. It never prints the secrets. Release builds fail before compilation when a required secret is missing.

Use the same test keystore for every APK update. Android only installs an update over the existing copy when the package ID and signing certificate remain the same. Keep a secure backup of the original keystore and its passwords; losing them prevents signing compatible updates.

## Publish a test build

After configuring the secrets, create and push a version tag from a commit intended for testing:

```sh
git tag android-v1.0.0
git push origin android-v1.0.0
```

When the workflow finishes, the APK is attached to the GitHub Release for that tag. The user downloads the APK on a Galaxy device, opens it, and allows installation from the browser or file manager if Android asks. Use a new tag for each new version; rerun a workflow only to rebuild the same tag and replace its APK asset.

## Signing key and Play Store

This workflow uses a dedicated test certificate. Before a Play Store release, decide whether the Play signing setup can continue with this certificate or whether testers will need to uninstall the test build before installing the Play-distributed build. Store enrollment and public publishing remain a separate task.
