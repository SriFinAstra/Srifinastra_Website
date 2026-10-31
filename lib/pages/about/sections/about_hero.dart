import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_text.dart';
import '../../../shared/widgets/hero_banner.dart';

class AboutHero extends StatelessWidget {
  const AboutHero({super.key});

  @override
  Widget build(BuildContext context) {
    return const HeroBanner(
      image: AppAssets.aboutHero,
      minHeight: 460,
      eyebrow: 'About Us',
      title: 'Building a Stronger\nFinancial Tomorrow',
      body: '${AppInfo.name} is a Chartered Accountancy firm committed to '
          'delivering expert financial, tax and compliance solutions for '
          'individuals and businesses.',
    );
  }
}
