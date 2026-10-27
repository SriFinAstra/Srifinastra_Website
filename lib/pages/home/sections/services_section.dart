import 'package:flutter/material.dart';

import '../../../core/widgets/responsive_layout.dart';
import '../../../core/widgets/section_container.dart';
import '../../../core/widgets/section_title.dart';
import '../../../data/models/service_model.dart';
import '../../../shared/widgets/service_card.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      child: Column(
        children: [
          const SectionTitle(eyebrow: 'Our Services', centered: true),
          const SizedBox(height: 32),
          ResponsiveGrid(
            desktopColumns: 3,
            children: [
              for (final s in ServiceModel.all) ServiceCard(service: s),
            ],
          ),
        ],
      ),
    );
  }
}
