import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text.dart';
import '../../data/models/service_model.dart';

/// Service card. [centered] = Home style (round icon, "Learn More →");
/// otherwise About style (left-aligned, square icon, arrow).
///
/// Meant to sit inside ResponsiveGrid (it stretches to the row height).
class ServiceCard extends StatefulWidget {
  const ServiceCard({super.key, required this.service, this.centered = true});

  final ServiceModel service;
  final bool centered;

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final s = widget.service;
    final centered = widget.centered;
    final align = centered ? TextAlign.center : TextAlign.start;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: () => context.push(AppRoutes.service(s.slug)),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          transform: Matrix4.translationValues(0, _hover ? -4 : 0, 0),
          padding: const EdgeInsets.fromLTRB(22, 26, 22, 22),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: _hover ? AppColors.sage : AppColors.border,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryDark.withAlpha(_hover ? 28 : 10),
                blurRadius: _hover ? 24 : 12,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment:
                centered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
            children: [
              _IconBadge(icon: s.icon, color: s.color, round: centered),
              const SizedBox(height: 18),
              Text(s.title, style: AppText.title, textAlign: align),
              const SizedBox(height: 8),
              Text(
                s.tagline,
                textAlign: align,
                style: AppText.small.copyWith(fontSize: 13),
              ),
              const SizedBox(height: 18),
              const Spacer(),
              if (centered)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Learn More',
                      style: AppText.button.copyWith(
                        fontSize: 13,
                        color: AppColors.primaryDark,
                      ),
                    ),
                    const SizedBox(width: 6),
                    AnimatedSlide(
                      duration: const Duration(milliseconds: 200),
                      offset: Offset(_hover ? 0.3 : 0, 0),
                      child: const Icon(
                        Icons.arrow_forward_rounded,
                        size: 15,
                        color: AppColors.primaryDark,
                      ),
                    ),
                  ],
                )
              else
                AnimatedSlide(
                  duration: const Duration(milliseconds: 200),
                  offset: Offset(_hover ? 0.3 : 0, 0),
                  child: const Icon(
                    Icons.arrow_forward_rounded,
                    size: 18,
                    color: AppColors.primaryDark,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _IconBadge extends StatelessWidget {
  const _IconBadge({
    required this.icon,
    required this.color,
    required this.round,
  });

  final IconData icon;
  final Color color;
  final bool round;

  @override
  Widget build(BuildContext context) {
    final size = round ? 58.0 : 46.0;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: round ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: round ? null : BorderRadius.circular(12),
      ),
      child: Icon(icon, color: AppColors.white, size: round ? 28 : 24),
    );
  }
}
