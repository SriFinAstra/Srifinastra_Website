import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/about/about_page.dart';
import '../pages/contact/contact_page.dart';
import '../pages/faq/faq_page.dart';
import '../pages/home/home_page.dart';
import '../pages/services/service_details_page.dart';
import '../pages/services/services_page.dart';

/// All route paths in one place, so links never hard-code strings.
class AppRoutes {
  AppRoutes._();

  static const home = '/';
  static const about = '/about';
  static const services = '/services';
  static const faq = '/faq';
  static const contact = '/contact';

  static String service(String slug) => '/services/$slug';
}

CustomTransitionPage<void> _fadePage(GoRouterState state, Widget child) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 250),
    transitionsBuilder: (context, animation, _, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    GoRoute(
      path: AppRoutes.home,
      pageBuilder: (context, state) => _fadePage(state, const HomePage()),
    ),
    GoRoute(
      path: AppRoutes.about,
      pageBuilder: (context, state) => _fadePage(state, const AboutPage()),
    ),
    GoRoute(
      path: AppRoutes.services,
      pageBuilder: (context, state) => _fadePage(state, const ServicesPage()),
      routes: [
        GoRoute(
          path: ':slug',
          pageBuilder: (context, state) => _fadePage(
            state,
            ServiceDetailsPage(slug: state.pathParameters['slug'] ?? ''),
          ),
        ),
      ],
    ),
    GoRoute(
      path: AppRoutes.faq,
      pageBuilder: (context, state) => _fadePage(state, const FaqPage()),
    ),
    GoRoute(
      path: AppRoutes.contact,
      pageBuilder: (context, state) => _fadePage(state, const ContactPage()),
    ),
  ],
  // Unknown URLs fall back to the home page.
  errorBuilder: (context, state) => const HomePage(),
);
