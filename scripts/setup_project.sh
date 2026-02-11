#!/usr/bin/env bash
set -euo pipefail

# Bootstraps this repository as a full Flutter project with Android/iOS/Web support.
# Run from repo root:
#   bash scripts/setup_project.sh

if ! command -v flutter >/dev/null 2>&1; then
  echo "Flutter is not installed or not on PATH."
  echo "Install it first: bash scripts/install_flutter.sh"
  exit 1
fi

echo "Using Flutter: $(flutter --version | head -n 1)"

# Generate missing platform folders without overwriting Dart source files.
flutter create --platforms=android,ios,web --project-name super10 .

flutter pub get

# Enable web explicitly (safe to run repeatedly).
flutter config --enable-web

# Validate toolchain.
flutter doctor -v

echo ''
echo 'Setup complete. Example run commands:'
echo '  flutter run -d chrome'
echo '  flutter run -d android'
echo '  flutter run -d ios'
