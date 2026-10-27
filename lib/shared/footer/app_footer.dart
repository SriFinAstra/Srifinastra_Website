import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text.dart';
import '../../core/constants/legal_text.dart';
import '../../core/responsive/responsive.dart';
import '../../core/utils/link_launcher.dart';
import '../../core/widgets/leaf.dart';
import '../../core/widgets/section_container.dart';
import '../navbar/app_navbar.dart';
import '../widgets/brand_logo.dart';
import '../widgets/legal_dialog.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = Responsive.isMobile(context);

    // Logo + short text + social icons, like the reference footer.
    final brand = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => context.go(AppRoutes.home),
            // The logo is dark-on-transparent, so it sits on a cream card.
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const BrandLogo(height: 84),
            ),
          ),
        ),
        const SizedBox(height: 16),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 340),
          child: Text(
            'Your trusted partner for end-to-end financial, compliance and '
            'business advisory services. We help individuals and businesses '
            'grow with clarity, compliance and confidence.',
            style: AppText.small.copyWith(color: AppColors.textLight),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _SocialIcon(
              tooltip: 'Instagram',
              asset: 'assets/icons/social_instagram.png',
              onTap: () => LinkLauncher.open(AppInfo.instagram),
            ),
            _SocialIcon(
              tooltip: 'WhatsApp',
              asset: 'assets/icons/social_whatsapp.png',
              onTap: () => LinkLauncher.whatsapp(AppInfo.phoneRaw, message: 'Hi'),
            ),
          ],
        ),
      ],
    );

    final quickLinks = _FooterColumn(
      title: 'Quick Links',
      children: [
        for (final item in navItems)
          _FooterLink(
            label: item.label,
            onTap: () => context.go(item.path),
          ),
        _FooterLink(
          label: 'Privacy Policy',
          onTap: () => showLegalDialog(context, LegalText.privacy),
        ),
        _FooterLink(
          label: 'Terms & Conditions',
          onTap: () => showLegalDialog(context, LegalText.terms),
        ),
      ],
    );

    final contact = _FooterColumn(
      title: 'Contact Us',
      children: [
        _FooterLink(
          icon: Icons.phone_outlined,
          label: AppInfo.phone,
          onTap: () => LinkLauncher.call(AppInfo.phoneRaw),
        ),
        _FooterLink(
          icon: Icons.mail_outline_rounded,
          label: AppInfo.email,
          onTap: () => LinkLauncher.email(AppInfo.email),
        ),
      ],
    );

    final columns = mobile
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              brand,
              const SizedBox(height: 36),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: quickLinks),
                  const SizedBox(width: 16),
                  Expanded(child: contact),
                ],
              ),
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 5, child: brand),
              Expanded(flex: 3, child: quickLinks),
              Expanded(flex: 4, child: contact),
            ],
          );

    final year = DateTime.now().year;
    final bottomStyle = AppText.small.copyWith(
      fontSize: 12.5,
      color: AppColors.textLight.withAlpha(190),
    );

    return Stack(
      children: [
        Positioned.fill(
          child: Container(color: AppColors.primaryDark),
        ),
        const Positioned(
          right: 30,
          bottom: -20,
          child: Leaf(width: 60, height: 150, opacity: 0.25, angle: -0.4),
        ),
        const Positioned(
          right: -10,
          bottom: 20,
          child: Leaf(width: 50, height: 120, opacity: 0.18, angle: 0.5),
        ),
        SectionContainer(
          topPadding: 56,
          bottomPadding: 28,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              columns,
              const SizedBox(height: 40),
              Divider(color: AppColors.textLight.withAlpha(40), height: 1),
              const SizedBox(height: 20),
              // Centred, like the reference footer.
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Text(
                      '© $year ${AppInfo.name}. All Rights Reserved.',
                      style: bottomStyle,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    _DevCredit(style: bottomStyle),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// "Developed by Matric Services": the whole line is highlighted and links
/// to their site.
class _DevCredit extends StatelessWidget {
  const _DevCredit({required this.style});

  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => LinkLauncher.open('https://www.matricservices.in/'),
        child: Text(
          'Developed by Matric Services',
          style: style.copyWith(
            fontSize: 13.5,
            color: AppColors.white,
            fontWeight: FontWeight.w600,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.white,
          ),
        ),
      ),
    );
  }
}

class _FooterColumn extends StatelessWidget {
  const _FooterColumn({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppText.title.copyWith(fontSize: 15, color: AppColors.white),
        ),
        const SizedBox(height: 16),
        ...children,
      ],
    );
  }
}

class _FooterLink extends StatefulWidget {
  const _FooterLink({required this.label, this.icon, this.onTap});

  final String label;
  final IconData? icon;
  final VoidCallback? onTap;

  @override
  State<_FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<_FooterLink> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final clickable = widget.onTap != null;
    final color = _hover && clickable ? AppColors.white : AppColors.textLight;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: MouseRegion(
        cursor: clickable ? SystemMouseCursors.click : MouseCursor.defer,
        onEnter: (_) => setState(() => _hover = true),
        onExit: (_) => setState(() => _hover = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null) ...[
                Icon(widget.icon, size: 17, color: color),
                const SizedBox(width: 10),
              ],
              Flexible(
                child: Text(
                  widget.label,
                  style: AppText.small.copyWith(color: color),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Rounded-square social button, like the reference footer.
class _SocialIcon extends StatelessWidget {
  const _SocialIcon({
    required this.tooltip,
    required this.asset,
    required this.onTap,
  });

  final String tooltip;
  final String asset;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: IconButton(
        tooltip: tooltip,
        onPressed: onTap,
        style: IconButton.styleFrom(
          backgroundColor: AppColors.white.withAlpha(20),
          fixedSize: const Size(44, 44),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        icon: Image.asset(asset, width: 20, height: 20),
      ),
    );
  }
}
