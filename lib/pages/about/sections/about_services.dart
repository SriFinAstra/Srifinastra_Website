import 'package:flutter/material.dart';

import '../../../core/widgets/responsive_layout.dart';
import '../../../core/widgets/section_container.dart';
import '../../../core/widgets/section_title.dart';
import '../../../data/models/service_model.dart';
import '../../../shared/widgets/service_card.dart';

class AboutServices extends StatelessWidget {
  const AboutServices({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: 'Our Services',
            subtitle: 'Comprehensive financial solutions for your needs.',
          ),
          const SizedBox(height: 28),
          ResponsiveGrid(
            desktopColumns: 3,
            children: [
              for (final s in ServiceModel.all)
                ServiceCard(service: s, centered: false),
            ],
          ),
        ],
      ),
    );
  }
}
