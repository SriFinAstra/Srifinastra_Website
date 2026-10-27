import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_text.dart';
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

    // TODO: replace with the firm's real story (founding year, partners).
    const text = SectionTitle(
      title: 'Our Story',
      subtitle: 'Founded with a vision to simplify complex financial matters, '
          '${AppInfo.name} has grown into a trusted partner for clients '
          'across India. We believe in integrity, '
          'expertise and a client-first approach, ensuring that every '
          'solution is tailored to your unique financial goals.',
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
