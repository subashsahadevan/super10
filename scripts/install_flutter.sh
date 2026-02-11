#!/usr/bin/env bash
set -euo pipefail

# Installs Flutter SDK on Linux/macOS into a user-controlled directory.
# Usage:
#   bash scripts/install_flutter.sh
#   FLUTTER_HOME=$HOME/tools/flutter FLUTTER_REF=3.24.3 bash scripts/install_flutter.sh

FLUTTER_HOME="${FLUTTER_HOME:-$HOME/tools/flutter}"
FLUTTER_REF="${FLUTTER_REF:-stable}" # e.g. stable, beta, master, or a tag like 3.24.3

OS="$(uname -s)"
case "$OS" in
  Linux|Darwin) ;;
  *)
    echo "Unsupported OS: $OS"
    exit 1
    ;;
esac

if ! command -v git >/dev/null 2>&1; then
  echo "git is required to install Flutter. Please install git first."
  exit 1
fi

mkdir -p "$(dirname "$FLUTTER_HOME")"

if [[ -d "$FLUTTER_HOME/.git" ]]; then
  echo "Updating existing Flutter SDK at $FLUTTER_HOME"
  git -C "$FLUTTER_HOME" fetch --tags --prune
else
  echo "Cloning Flutter SDK to $FLUTTER_HOME"
  rm -rf "$FLUTTER_HOME"
  git clone https://github.com/flutter/flutter.git "$FLUTTER_HOME"
fi

git -C "$FLUTTER_HOME" checkout "$FLUTTER_REF"

case ":$PATH:" in
  *":$FLUTTER_HOME/bin:"*) ;;
  *) export PATH="$FLUTTER_HOME/bin:$PATH" ;;
esac

if ! grep -q 'tools/flutter/bin' "$HOME/.bashrc" 2>/dev/null; then
  {
    echo ''
    echo '# Flutter SDK'
    echo 'export PATH="$HOME/tools/flutter/bin:$PATH"'
  } >> "$HOME/.bashrc"
fi

echo "Flutter installed in: $FLUTTER_HOME"
flutter --version

echo ''
echo 'Next steps:'
echo '  1) Open a new shell OR run: export PATH="$FLUTTER_HOME/bin:$PATH"'
echo '  2) Run: flutter doctor'
