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
      title: 'Clarity in Finance\nConfidence in Every Decision',
      body: 'At Sri Fin Astra, we believe that trust, integrity, and expertise are the foundation of every successful financial partnership.' 
      'We provide personalized financial and compliance solutions while prioritizing the security and confidentiality of your information.' 
      'From strategic tax planning and regulatory compliance to corporate advisory and sustainable business growth, '
      'we deliver reliable guidance and tailored solutions that help you build with confidence and move towards long-term success.',
      
      action: AppButton(
        label: 'Explore Our Services',
        showArrow: true,
        onPressed: () => context.go(AppRoutes.services),
      ),
    );
  }
}
