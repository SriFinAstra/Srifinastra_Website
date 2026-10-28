#!/usr/bin/env bash
set -euo pipefail

git clone --depth 1 --branch stable \
  https://github.com/flutter/flutter.git /tmp/flutter

export PATH="/tmp/flutter/bin:$PATH"

flutter --version
flutter pub get
flutter build web --release
