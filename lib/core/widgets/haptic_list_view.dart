import 'package:flutter/material.dart';
import 'package:taqsema/core/utils/app_haptics.dart';

class HapticListView extends StatefulWidget {
  const HapticListView({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    required this.separatorBuilder,
    this.padding,
    this.controller,
  });

  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder separatorBuilder;
  final EdgeInsetsGeometry? padding;
  final ScrollController? controller;

  @override
  State<HapticListView> createState() => _HapticListViewState();
}

class _HapticListViewState extends State<HapticListView> {
  ScrollController? _internalController;
  final Stopwatch _stopwatch = Stopwatch();

  double _lastHapticOffset = 0;
  int _lastHapticMs = 0;
  bool _isOverscrolling = false;

  // Thresholds (Pixels per frame)
  static const double _baseThreshold = 50.0;
  static const double _minThreshold = 20.0;
  static const double _maxThreshold = 80.0;

  @override
  void initState() {
    super.initState();
    _stopwatch.start();
  }

  @override
  void dispose() {
    _stopwatch.stop();
    _internalController?.dispose();
    super.dispose();
  }

  bool _onNotification(ScrollNotification n) {
    if (n is ScrollUpdateNotification) {
      if (n.depth == 0) {
        final delta = n.scrollDelta;
        if (delta != null) {
          _handleScrollUpdate(n.metrics.pixels, delta.abs());
        }
      }
    } else if (n is OverscrollNotification) {
      if (!_isOverscrolling) {
        AppHaptics.success(); // Medium thud on edge hit
        _isOverscrolling = true;
      }
    } else if (n is ScrollEndNotification) {
      _isOverscrolling = false;
    }
    return false;
  }

  void _handleScrollUpdate(double currentOffset, double speed) {
    final now = _stopwatch.elapsedMilliseconds;

    // Safety Throttle: Prevent motor stutter on Android
    if (now - _lastHapticMs < 40) return;

    final distanceSinceLastHaptic = (currentOffset - _lastHapticOffset).abs();
    final threshold = _calculateAdaptiveThreshold(speed);

    if (distanceSinceLastHaptic >= threshold) {
      _triggerScrollHaptic(speed);
      _lastHapticOffset = currentOffset;
      _lastHapticMs = now;
    }
  }

  double _calculateAdaptiveThreshold(double speed) {
    // speed is pixels per frame (approx 16ms)
    if (speed > 40) return _minThreshold; // Very Fast
    if (speed > 20) return _baseThreshold * 0.6; // Fast
    if (speed > 10) return _baseThreshold * 0.8; // Medium
    if (speed > 5) return _baseThreshold; // Slow
    return _maxThreshold; // Creeping
  }

  void _triggerScrollHaptic(double speed) {
    // Variable intensity: Heavier feel when moving fast
    if (speed > 60) {
      AppHaptics.buttonPress();
    } else {
      AppHaptics.selection();
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: _onNotification,
      child: ListView.separated(
        // Use provided controller or create an internal one
        controller:
            widget.controller ?? (_internalController ??= ScrollController()),
        physics: const BouncingScrollPhysics(),
        padding: widget.padding,
        itemCount: widget.itemCount,
        separatorBuilder: widget.separatorBuilder,
        itemBuilder: widget.itemBuilder,
      ),
    );
  }
}
