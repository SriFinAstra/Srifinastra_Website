import 'dart:async';

import 'package:flutter/gestures.dart' show PointerDeviceKind;
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text.dart';
import '../../../core/responsive/responsive.dart';
import '../../../core/widgets/section_container.dart';
import '../../../core/widgets/section_title.dart';
import '../../../data/reviews_data.dart';

/// Client reviews.
///
/// - Moves on by itself every 5 seconds (and loops back to the start).
/// - You can also drag / swipe it left or right, or use the arrows. Cards
///   settle neatly into place, and the 5-second countdown starts again after
///   you let go.
class ReviewsSection extends StatefulWidget {
  const ReviewsSection({super.key});

  @override
  State<ReviewsSection> createState() => _ReviewsSectionState();
}

class _ReviewsSectionState extends State<ReviewsSection> {
  static const _gap = 20.0;
  static const _autoEvery = Duration(seconds: 5);

  final _controller = ScrollController();
  Timer? _timer;
  double _step = 340;

  @override
  void initState() {
    super.initState();
    _restartTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  /// Next automatic move happens 5 seconds from now.
  void _restartTimer() {
    _timer?.cancel();
    _timer = Timer(_autoEvery, () {
      if (!mounted) return;
      _move(1);
      _restartTimer();
    });
  }

  /// Scrolls one card left (-1) or right (+1), looping at either end.
  void _move(int direction) {
    if (!_controller.hasClients) return;
    final max = _controller.position.maxScrollExtent;
    final current = _controller.offset;

    double target = current + direction * _step;
    if (direction > 0 && current >= max - 8) target = 0;
    if (direction < 0 && current <= 8) target = max;

    _controller.animateTo(
      target.clamp(0.0, max),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  void _arrow(int direction) {
    _move(direction);
    _restartTimer();
  }

  /// After a drag or swipe, settle on the nearest card.
  bool _snapToCard(ScrollNotification n) {
    if (n is ScrollEndNotification && _controller.hasClients) {
      final max = _controller.position.maxScrollExtent;
      final snapped = ((_controller.offset / _step).round() * _step)
          .clamp(0.0, max);
      if ((snapped - _controller.offset).abs() > 1) {
        _controller.animateTo(
          snapped,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final mobile = Responsive.isMobile(context);
    final tablet = Responsive.isTablet(context);

    return SectionContainer(
      child: Column(
        children: [
          const SectionTitle(
            eyebrow: 'Client Reviews',
            title: 'What Our Clients Say',
            subtitle: 'Individuals and businesses trust us with their tax, '
                'accounting and compliance.',
            centered: true,
          ),
          const SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              final perView = mobile ? 1.0 : (tablet ? 2.0 : 3.0);
              final cardWidth = mobile
                  ? constraints.maxWidth * 0.88
                  : (constraints.maxWidth - _gap * (perView - 1)) / perView;
              _step = cardWidth + _gap;

              return Listener(
                // Hold the timer while you are dragging, restart on release.
                onPointerDown: (_) => _timer?.cancel(),
                onPointerUp: (_) => _restartTimer(),
                onPointerCancel: (_) => _restartTimer(),
                child: NotificationListener<ScrollNotification>(
                  onNotification: _snapToCard,
                  child: SizedBox(
                    height: mobile ? 330 : 290,
                    child: ScrollConfiguration(
                      // Let the mouse drag the list too, not only touch.
                      behavior: ScrollConfiguration.of(context).copyWith(
                        scrollbars: false,
                        dragDevices: {
                          PointerDeviceKind.touch,
                          PointerDeviceKind.mouse,
                          PointerDeviceKind.trackpad,
                          PointerDeviceKind.stylus,
                        },
                      ),
                      child: ListView.separated(
                        controller: _controller,
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        itemCount: ReviewsData.reviews.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: _gap),
                        itemBuilder: (context, index) => SizedBox(
                          width: cardWidth,
                          child: _ReviewCard(review: ReviewsData.reviews[index]),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ArrowButton(
                icon: Icons.arrow_back_rounded,
                tooltip: 'Previous review',
                onTap: () => _arrow(-1),
              ),
              const SizedBox(width: 12),
              _ArrowButton(
                icon: Icons.arrow_forward_rounded,
                tooltip: 'Next review',
                onTap: () => _arrow(1),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ReviewCard extends StatelessWidget {
  const _ReviewCard({required this.review});

  final ReviewModel review;

  @override
  Widget build(BuildContext context) {
    final initial = review.name.isEmpty ? '' : review.name[0].toUpperCase();

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              for (var i = 0; i < 5; i++)
                Icon(
                  i < review.rating
                      ? Icons.star_rounded
                      : Icons.star_outline_rounded,
                  size: 20,
                  color: AppColors.accent,
                ),
            ],
          ),
          const SizedBox(height: 14),
          Expanded(
            child: Text(
              review.text,
              overflow: TextOverflow.fade,
              style: AppText.body.copyWith(height: 1.55),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.mint,
                child: Text(
                  initial,
                  style: AppText.title.copyWith(
                    fontSize: 17,
                    color: AppColors.primary,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  review.name,
                  style: AppText.title.copyWith(fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ArrowButton extends StatelessWidget {
  const _ArrowButton({
    required this.icon,
    required this.tooltip,
    required this.onTap,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: tooltip,
      onPressed: onTap,
      style: IconButton.styleFrom(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.primary,
        side: const BorderSide(color: AppColors.border),
        fixedSize: const Size(46, 46),
      ),
      icon: Icon(icon, size: 22),
    );
  }
}
