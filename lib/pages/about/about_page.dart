import 'package:flutter/material.dart';

import '../../shared/widgets/cta_banner.dart';
import '../../shared/widgets/page_scaffold.dart';
import 'sections/about_hero.dart';
import 'sections/about_services.dart';
import 'sections/our_story.dart';
import 'sections/values_section.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      children: [
        AboutHero(),
        OurStory(),
        ValuesSection(),
        AboutServices(),
        CtaBanner(),
      ],
    );
  }
}
