# Papership

Papership is a modern, beautifully designed Flutter companion application for [Paperless-NGX](https://docs.paperless-ngx.com/). It allows you to seamlessly scan, organize, and upload your documents directly from your Android device.

## Features

- **Multi-Server Management:** Configure and seamlessly switch between multiple Paperless-NGX servers.
- **Robust Authentication:** Supports Username/Password, API Tokens, OIDC, Custom Headers, and mTLS.
- **Hardware Network Scanning:** Uses zero-configuration networking (mDNS) to discover local eSCL scanners (like Canon, HP, Brother) and stream scans directly to the app without a PC.
- **Camera Scanning:** Includes a high-performance perspective-correcting camera scanner for quick document capture on the go.
- **Background Uploads:** Scan your documents offline or on a spotty connection. The built-in WorkManager will queue your uploads and sync them seamlessly in the background once you are online.
- **Metadata Tagging:** Assign Titles, Tags, Correspondents, and Document Types with full API-driven searchable dropdowns.
- **Biometric Security:** Lock your app automatically with fingerprint or face unlock.
- **Material You Design:** Built from the ground up to support Android 12+ dynamic colors and deep dark mode integrations.

## Screenshots

*(Screenshots will be uploaded here. Note: Only real application screenshots will be used.)*

## Getting Started

### Prerequisites

- Flutter SDK (stable channel, 3.19+)
- Java 17
- Android SDK 34+

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/orchestrator-dev/papership.git
   cd papership
   ```

2. **Fetch Dependencies:**
   ```bash
   flutter pub get
   ```

3. **Generate Code:**
   The app uses `freezed` and `injectable`, so you must run the build runner before compiling:
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Run the App:**
   ```bash
   flutter run
   ```

## Automated Releases

This repository is configured with a **GitHub Actions** workflow that automatically compiles and releases both `.apk` and `.aab` bundles whenever a new tag is pushed (e.g., `v1.0.0`). 

To trigger a release manually, push a new version tag:
```bash
git tag -a v1.0.0 -m "Release v1.0.0"
git push origin v1.0.0
```

### Play Store Deployment
To integrate with the Google Play Store, configure your `upload-keystore.jks` and add the following secrets to your GitHub repository:
- `KEY_ALIAS`
- `KEY_PASSWORD`
- `STORE_PASSWORD`
- `KEYSTORE_BASE64`

## Architecture

Papership enforces strict Clean Architecture principles:
- **Domain Layer:** Pure Dart. Contains business logic, UseCases, and abstract repositories.
- **Data Layer:** Interacts with the `PaperlessApiService` (via Retrofit/Dio) and local device storage.
- **Presentation Layer:** Built entirely on `flutter_bloc` (Cubits) and standard Material 3 widgets.

## License

This project is licensed under the MIT License - see the LICENSE file for details.