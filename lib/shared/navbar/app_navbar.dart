import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text.dart';
import '../../core/responsive/breakpoints.dart';
import '../../core/responsive/responsive.dart';
import '../widgets/brand_logo.dart';

typedef NavItem = ({String label, String path});

const List<NavItem> navItems = [
  (label: 'Home', path: AppRoutes.home),
  (label: 'About Us', path: AppRoutes.about),
  (label: 'Services', path: AppRoutes.services),
  (label: 'FAQs', path: AppRoutes.faq),
  (label: 'Contact', path: AppRoutes.contact),
];

bool _isActive(String currentPath, String itemPath) {
  if (itemPath == AppRoutes.home) return currentPath == AppRoutes.home;
  return currentPath.startsWith(itemPath);
}

/// Below this width the links collapse into a menu button.
const double _menuBreakpoint = 960;

class AppNavbar extends StatelessWidget {
  const AppNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentPath = GoRouterState.of(context).uri.path;
    final showLinks = Responsive.width(context) >= _menuBreakpoint;

    return Container(
      height: Responsive.isMobile(context) ? 72 : 84,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.horizontalPadding(context),
      ),
      decoration: const BoxDecoration(
        color: AppColors.background,
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints:
              const BoxConstraints(maxWidth: Breakpoints.maxContentWidth),
          child: Row(
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => context.go(AppRoutes.home),
                  child: const BrandLogo(),
                ),
              ),
              const Spacer(),
              if (showLinks) ...[
                for (final item in navItems)
                  _NavLink(
                    label: item.label,
                    active: _isActive(currentPath, item.path),
                    onTap: () => context.go(item.path),
                  ),
                ] else
                IconButton(
                  tooltip: 'Menu',
                  icon: const Icon(Icons.menu_rounded,
                      color: AppColors.primaryDark, size: 28),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  const _NavLink({
    required this.label,
    required this.active,
    required this.onTap,
  });

  final String label;
  final bool active;
  final VoidCallback onTap;

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final highlighted = widget.active || _hover;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 8),
              Text(
                widget.label,
                style: AppText.nav.copyWith(
                  color: highlighted ? AppColors.primary : AppColors.textDark,
                  fontWeight:
                      widget.active ? FontWeight.w600 : FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 2,
                width: widget.active ? 28 : (_hover ? 16 : 0),
                color: AppColors.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Slide-out menu for tablet / mobile.
class AppNavDrawer extends StatelessWidget {
  const AppNavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final currentPath = GoRouterState.of(context).uri.path;

    return Drawer(
      backgroundColor: AppColors.background,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      Scaffold.of(context).closeEndDrawer();
                      context.go(AppRoutes.home);
                    },
                    child: const BrandLogo(height: 44),
                  ),
                  const Spacer(),
                  IconButton(
                    tooltip: 'Close',
                    icon: const Icon(Icons.close_rounded),
                    onPressed: () => Scaffold.of(context).closeEndDrawer(),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              for (final item in navItems)
                _DrawerLink(
                  label: item.label,
                  active: _isActive(currentPath, item.path),
                  onTap: () {
                    Scaffold.of(context).closeEndDrawer();
                    context.go(item.path);
                  },
                ),
              ],
          ),
        ),
      ),
    );
  }
}

class _DrawerLink extends StatelessWidget {
  const _DrawerLink({
    required this.label,
    required this.active,
    required this.onTap,
  });

  final String label;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        decoration: BoxDecoration(
          color: active ? AppColors.mint : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: AppText.nav.copyWith(
            fontSize: 17,
            color: active ? AppColors.primary : AppColors.textDark,
            fontWeight: active ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}