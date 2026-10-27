import 'package:flutter/material.dart';

import '../core/constants/app_text.dart';
import 'router.dart';
import 'theme.dart';

class SriFinAstraApp extends StatelessWidget {
  const SriFinAstraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: '${AppInfo.name} | Chartered Accountants',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: appRouter,
    );
  }
}
