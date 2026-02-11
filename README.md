# Super10

**Super10** is a Flutter trivia app that runs fast-paced competitions every hour.

## Core gameplay

- A new competition starts every 1 hour.
- Each user gets 10 questions per round.
- Every question has 4 options.
- Players have 10 seconds to answer each question.
- A leaderboard ranks players by score.

## Full cross-platform setup (Android, iOS, Web)

This repository contains helper scripts to install Flutter and bootstrap all target platforms.

### 1) Install Flutter SDK

```bash
bash scripts/install_flutter.sh
```

> Optional: install a pinned version/tag
>
> ```bash
> FLUTTER_REF=3.24.3 bash scripts/install_flutter.sh
> ```

### 2) Configure this repo for Android + iOS + Web

```bash
bash scripts/setup_project.sh
```

This command:

- creates/updates Flutter platform folders (`android/`, `ios/`, `web/`),
- runs `flutter pub get`,
- enables web support,
- runs `flutter doctor -v` for validation.

### 3) Run the app

```bash
# Web
flutter run -d chrome

# Android (requires Android SDK/device/emulator)
flutter run -d android

# iOS (macOS + Xcode required)
flutter run -d ios
```

## Platform prerequisites

### Android

- Android Studio (or Android SDK command-line tools)
- Java 17+
- At least one emulator or physical device

### iOS

- macOS machine
- Xcode + Xcode Command Line Tools
- CocoaPods (`sudo gem install cocoapods`)

### Web

- Chrome/Edge browser installed

## Current UI scope

Initial UI scaffold has been created with:

- Home screen with hourly competition banner
- Sample timed question card (10-second indicator)
- Leaderboard preview section
- Bottom action area showing next competition countdown
