import 'package:flutter/material.dart';

abstract class AppColors {
  // =================================================================
  // 1. THE PALETTE (Raw Colors)
  // =================================================================
  static const Color _brickEmber = Color(0xFFB80C09);
  static const Color _yaleBlue = Color(0xFF0B4F6C);
  static const Color _brightSky = Color(0xFF01BAEF);
  static const Color _ghostWhite = Color(0xFFFBFBFF);
  static const Color _inkBlack = Color(0xFF040F16);
  static const Color _emerlad = Color(0xFF06D6A0);
  static const Color _grey = Color(0xFF9E9E9E);
  // =================================================================
  // 2. THE THEME (Semantic Names)
  // =================================================================
  //Main Colors
  static const Color selected = _emerlad;
  static final Color selectedWithAlpha = _emerlad.withAlpha(150);
  static const Color notSelected = _brickEmber;
  static const Color teamA = _brightSky;
  static const Color teamB = _yaleBlue;
  static const Color primary = _emerlad;
  static const Color secondary = _brickEmber;
  static const Color matchHistoryContainer = _yaleBlue;

  static const Color error = _brickEmber;
  static const Color success = _emerlad;

  // Backgrounds
  static const Color background = _inkBlack; // The screen background

  // Text
  static const Color primaryText = _ghostWhite; // Headings, main text
  static const Color secondaryText = _grey; // Subtitles, hints
}
