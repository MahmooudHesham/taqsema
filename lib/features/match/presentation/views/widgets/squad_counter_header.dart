import 'package:flutter/material.dart';
import 'package:taqsema/core/utils/app_colors.dart';
import 'package:taqsema/core/utils/app_styles.dart';

class SquadCounterHeader extends StatelessWidget {
  final int count;

  const SquadCounterHeader({super.key, required this.count});

  static const _duration = Duration(milliseconds: 200);
  static const _slideInOffset = Offset(0.0, 1.0);
  static const _emptyKey = ValueKey('empty');
  static const _counterKey = ValueKey('counter');

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedSwitcher(
        duration: _duration,
        transitionBuilder: _transitionBuilder,
        child: count == 0 ? _buildEmptyState() : _buildCounterState(),
      ),
    );
  }

  static Widget _transitionBuilder(Widget child, Animation<double> animation) {
    return SlideTransition(
      position: animation.drive(
        Tween<Offset>(begin: _slideInOffset, end: Offset.zero),
      ),
      child: FadeTransition(opacity: animation, child: child),
    );
  }

  Widget _buildEmptyState() {
    return Text(
      'Start Building Your Squad!',
      key: _emptyKey,
      style: AppStyles.textStyleMedium18.copyWith(
        color: AppColors.secondaryText,
      ),
    );
  }

  Widget _buildCounterState() {
    return Row(
      key: _counterKey,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Squad Size: ', style: AppStyles.textStyleMedium18),
        _AnimatedCounter(count: count),
      ],
    );
  }
}

class _AnimatedCounter extends StatefulWidget {
  final int count;

  const _AnimatedCounter({required this.count});

  @override
  State<_AnimatedCounter> createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<_AnimatedCounter> {
  static const _duration = Duration(milliseconds: 300);
  static const _slideUp = Offset(0.0, -1.0);
  static const _slideDown = Offset(0.0, 1.0);

  bool _isIncreasing = true;

  @override
  void didUpdateWidget(covariant _AnimatedCounter oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.count != widget.count) {
      _isIncreasing = widget.count > oldWidget.count;
    }
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedSwitcher(
        duration: _duration,
        reverseDuration: _duration,
        switchInCurve: Curves.easeOutBack,
        switchOutCurve: Curves.easeInBack,
        transitionBuilder: _buildTransition,
        child: Text(
          '${widget.count}',
          key: ValueKey<int>(widget.count),
          style: AppStyles.textStyleMedium18,
        ),
      ),
    );
  }

  Widget _buildTransition(Widget child, Animation<double> animation) {
    final bool isIncoming = (child.key as ValueKey<int>).value == widget.count;

    final (begin, end) = switch ((_isIncreasing, isIncoming)) {
      (true, true) => (_slideUp, Offset.zero),
      (true, false) => (Offset.zero, _slideDown),
      (false, true) => (_slideDown, Offset.zero),
      (false, false) => (Offset.zero, _slideUp),
    };

    return SlideTransition(
      position: animation.drive(Tween<Offset>(begin: begin, end: end)),
      child: FadeTransition(opacity: animation, child: child),
    );
  }
}
