import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/responsive/responsive.dart';
import '../../../core/widgets/app_image.dart';
import '../../../core/widgets/section_container.dart';
import '../../../core/widgets/section_title.dart';

class OurStory extends StatelessWidget {
  const OurStory({super.key});

  @override
  Widget build(BuildContext context) {
    final desktop = Responsive.isDesktop(context);

    final image = SizedBox(
      height: Responsive.value<double>(context, mobile: 240, desktop: 340),
      child: AppImage(
        AppAssets.ourStory,
        borderRadius: BorderRadius.circular(18),
        placeholderIcon: Icons.calculate_outlined,
      ),
    );

    const text = SectionTitle(
      title: 'Our Story',
      subtitle: 'Every financial journey has a destination. At Sri Fin Astra, we help you navigate yours.' 
          'Founded on the principle of making complex financial landscapes simple and accessible, '
          'we have evolved into a trusted wealth partner for clients across India. '
          'We combine data-driven strategy with human-centered planning, '
          'ensuring your unique life goals remain at the heart of everything we do.'
    );

    return SectionContainer(
      bottomPadding: 48,
      child: desktop
          ? Row(
              children: [
                Expanded(flex: 5, child: image),
                const SizedBox(width: 56),
                const Expanded(flex: 6, child: text),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [image, const SizedBox(height: 32), text],
            ),
    );
  }
}
