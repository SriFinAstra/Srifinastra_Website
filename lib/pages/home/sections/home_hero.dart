import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/widgets/app_button.dart';
import '../../../shared/widgets/hero_banner.dart';

class HomeHero extends StatelessWidget {
  const HomeHero({super.key});

  @override
  Widget build(BuildContext context) {
    return HeroBanner(
      image: AppAssets.homeHero,
      eyebrow: 'Trust   |   Compliance   |   Growth',
      title: 'Clarity in Finance.\nConfidence in Every Decision',
      body: 'Your trusted partner for end-to-end financial, compliance and '
          'business advisory services. We help individuals and businesses '
          'grow with clarity, compliance and confidence.',
      action: AppButton(
        label: 'Explore Our Services',
        showArrow: true,
        onPressed: () => context.go(AppRoutes.services),
      ),
    );
  }
}
