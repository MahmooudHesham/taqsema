import 'package:flutter/material.dart';
import 'package:taqsema/core/utils/app_colors.dart';
import 'package:taqsema/core/utils/size_config.dart';

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
  static TextStyle get textStyleLight16 =>
      _baseStyle.copyWith(fontSize: 16.fs, fontWeight: FontWeight.w300);

  static TextStyle get textStyleLight18 =>
      _baseStyle.copyWith(fontSize: 18.fs, fontWeight: FontWeight.w300);

  static TextStyle get textStyleLight20 =>
      _baseStyle.copyWith(fontSize: 20.fs, fontWeight: FontWeight.w300);

  // =========================
  // Regular (w400)
  // =========================
  static TextStyle get textStyleRegular11 => _baseStyle.copyWith(
    fontSize: 11.fs,
    fontWeight: FontWeight.normal, // w400
  );

  static TextStyle get textStyleRegular14 => _baseStyle.copyWith(
    fontSize: 14.fs,
    fontWeight: FontWeight.normal, // w400
  );

  static TextStyle get textStyleRegular16 => _baseStyle.copyWith(
    fontSize: 16.fs,
    fontWeight: FontWeight.normal, // w400
  );

  static TextStyle get textStyleRegular18 => _baseStyle.copyWith(
    fontSize: 18.fs,
    fontWeight: FontWeight.normal, // w400
  );

  static TextStyle get textStyleRegular24 => _baseStyle.copyWith(
    fontSize: 24.fs,
    fontWeight: FontWeight.normal, // w400
  );

  // =========================
  // Medium (w500)
  // =========================
  static TextStyle get textStyleMedium14 =>
      _baseStyle.copyWith(fontSize: 14.fs, fontWeight: FontWeight.w500);

  static TextStyle get textStyleMedium16 =>
      _baseStyle.copyWith(fontSize: 16.fs, fontWeight: FontWeight.w500);

  static TextStyle get textStyleMedium18 =>
      _baseStyle.copyWith(fontSize: 18.fs, fontWeight: FontWeight.w500);

  static TextStyle get textStyleMedium24 =>
      _baseStyle.copyWith(fontSize: 24.fs, fontWeight: FontWeight.w500);

  // =========================
  // Semi-Bold (w600)
  // This will now look distinct because it uses the specific SemiBold.ttf file
  // =========================
  static TextStyle get textStyleSemiBold16 =>
      _baseStyle.copyWith(fontSize: 16.fs, fontWeight: FontWeight.w600);

  static TextStyle get textStyleSemiBold20 =>
      _baseStyle.copyWith(fontSize: 20.fs, fontWeight: FontWeight.w600);

  // =========================
  // Bold (w700)
  // =========================
  static TextStyle get textStyleBold14 => _baseStyle.copyWith(
    fontSize: 14.fs,
    fontWeight: FontWeight.bold, // w700
  );

  static TextStyle get textStyleBold32 => _baseStyle.copyWith(
    fontSize: 32.fs,
    fontWeight: FontWeight.bold, // w700
  );

  static TextStyle get textStyleBold40 => _baseStyle.copyWith(
    fontSize: 40.fs,
    fontWeight: FontWeight.bold, // w700
  );
}
