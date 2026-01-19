import 'package:flutter/material.dart';
import 'package:t2sema/core/utils/app_colors.dart';

abstract class AppStyles {
  // 1. Define the Family Name (Must match the family name in pubspec.yaml)
  static const String _fontFamily = 'Rubik';

  // 2. Base Style (Private)
  static const TextStyle _baseStyle = TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.primaryText,
    // By default, TextStyle uses w400 (Regular)
  );

  // =========================
  // Light (w300)
  // =========================
  static final TextStyle textStyleLight18 = _baseStyle.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w300,
  );

  static final TextStyle textStyleLight20 = _baseStyle.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w300,
  );

  // =========================
  // Regular (w400)
  // =========================
  static final TextStyle textStyleRegular11 = _baseStyle.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.normal, // w400
  );

  static final TextStyle textStyleRegular14 = _baseStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.normal, // w400
  );

  static final TextStyle textStyleRegular16 = _baseStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.normal, // w400
  );

  static final TextStyle textStyleRegular18 = _baseStyle.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.normal, // w400
  );

  // =========================
  // Medium (w500)
  // =========================
  static final TextStyle textStyleMedium14 = _baseStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle textStyleMedium16 = _baseStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle textStyleMedium18 = _baseStyle.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle textStyleMedium24 = _baseStyle.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );

  // =========================
  // Semi-Bold (w600)
  // This will now look distinct because it uses the specific SemiBold.ttf file
  // =========================
  static final TextStyle textStyleSemiBold16 = _baseStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle textStyleSemiBold20 = _baseStyle.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  // =========================
  // Bold (w700)
  // =========================
  static final TextStyle textStyleBold32 = _baseStyle.copyWith(
    fontSize: 32,
    fontWeight: FontWeight.bold, // w700
  );

  static final TextStyle textStyleBold40 = _baseStyle.copyWith(
    fontSize: 40,
    fontWeight: FontWeight.bold, // w700
  );
}
