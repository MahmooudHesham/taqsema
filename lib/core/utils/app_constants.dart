import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:taqsema/core/utils/size_config.dart';

class AppConstants {
  // ✅ Your nav bar exact values
  static double get navBarHeight => 70.h;
  static double get navBarBottomPadding => 40.h;
  static double get snackBarGap => 16.h; // Gap between snackbar and nav bar

  static double snackBarBottomMargin(BuildContext context) {
    final bottomSafeArea = MediaQuery.of(context).viewPadding.bottom;

    // Total = max(safe area, nav bar padding) + nav bar height + gap
    // We use max because the UI uses SafeArea(minimum: EdgeInsets.only(bottom: 40))
    final effectiveBottomPadding = math.max(
      bottomSafeArea,
      navBarBottomPadding,
    );

    return effectiveBottomPadding + navBarHeight + snackBarGap;
  }
}
