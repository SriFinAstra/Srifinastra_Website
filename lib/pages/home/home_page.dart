import 'package:flutter/material.dart';

import '../../shared/widgets/page_scaffold.dart';
import 'sections/faq_section.dart';
import 'sections/home_hero.dart';
import 'sections/reviews_section.dart';
import 'sections/services_section.dart';
import 'sections/statistics_section.dart';
import 'sections/why_choose_us.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      children: [
        HomeHero(),
        ServicesSection(),
        WhyChooseUs(),
        StatisticsSection(),
        ReviewsSection(),
        FaqSection(),
      ],
    );
  }
}
