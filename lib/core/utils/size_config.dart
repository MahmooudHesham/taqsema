import 'dart:math' as math;

import 'package:flutter/material.dart';

class SizeConfig {
  static const double _designWidth = 375;
  static const double _designHeight = 812;

  static late double screenWidth;
  static late double screenHeight;

  static late double _scaleWidth;
  static late double _scaleHeight;
  static late double _scaleFactor;

  /// Initializes the SizeConfig with the current context.
  static void init(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    screenWidth = size.width;
    screenHeight = size.height;

    _scaleWidth = screenWidth / _designWidth;
    _scaleHeight = screenHeight / _designHeight;

    _scaleFactor = math.min(_scaleWidth, _scaleHeight);
  }

  static double w(double width) {
    return width * _scaleWidth.clamp(0.0, 1.0);
  }

  static double h(double height) {
    return height * _scaleHeight.clamp(0.0, 1.0);
  }

  /// Calculates font size based on design scale.
  /// Clamped between 0.8 and 1.15 to ensure readability.
  static double fs(double size) {
    return size * _scaleFactor.clamp(0.85, 1.1);
  }

  static double fsAccessible(BuildContext context, double size) {
    final textScaler = MediaQuery.textScalerOf(context);
    return textScaler.scale(size * _scaleFactor.clamp(0.85, 1.1));
  }
}

extension SizeConfigExt on num {
  double get w => SizeConfig.w(toDouble());

  double get h => SizeConfig.h(toDouble());

  double get fs => SizeConfig.fs(toDouble());
}
