import 'package:flutter/services.dart';

class AppHaptics {
  AppHaptics._();

  static Future<void> buttonPress() async {
    await HapticFeedback.lightImpact();
  }

  static Future<void> heavyWarning() async {
    await HapticFeedback.heavyImpact();
  }

  static Future<void> selection() async {
    await HapticFeedback.selectionClick();
  }

  static Future<void> success() async {
    await HapticFeedback.mediumImpact();
  }
}
