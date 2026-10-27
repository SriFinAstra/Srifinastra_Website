import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'app/app.dart';

void main() {
  // Clean URLs (/about instead of /#/about). Your host must rewrite every
  // path to index.html — see README for the Firebase Hosting config.
  usePathUrlStrategy();
  runApp(const SriFinAstraApp());
}
