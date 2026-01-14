import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:t2sema/core/utils/app_colors.dart';

class GlassContainer extends StatelessWidget {
  const GlassContainer({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.borderRadius = 50,
    this.blurStrength = 15.0,
    this.opacity = 25,
    required this.child,
  });

  final double? width, height;
  final double borderRadius, blurStrength;
  final EdgeInsetsGeometry? padding;
  final Widget child;
  final int opacity;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurStrength, sigmaY: blurStrength),
        child: Container(
          height: height,
          width: width,
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: AppColors.background.withAlpha(opacity),
            border: Border.all(color: Colors.white.withAlpha(50), width: 1.5),
          ),
          child: child,
        ),
      ),
    );
  }
}
