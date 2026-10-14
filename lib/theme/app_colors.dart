import 'package:flutter/material.dart';

class AppColors {
  static const Color red = Color(0xFFD92832);
  static const Color yellow = Color(0xFFFFC857);
  static const Color blue = Color(0xFF4A90C2);
  static const Color panelBlue = Color(0xFFB7C9D6);
  static const Color cream = Color(0xFFF6E8C8);
  static const Color paper = Color(0xFFFFF8E7);
  static const Color outline = Color(0xFF1E1E1E);
  static const Color darkBackground = Color(0xFF101722);
  static const Color darkSurface = Color(0xFF202B3B);
  static const Color darkPanel = Color(0xFF303D50);
  static const Color darkRed = Color(0xFF8F222B);
  static const Color darkBlue = Color(0xFF244B65);
  static const Color darkYellow = Color(0xFFFFC857);

  static Color get ink => appDarkMode.value ? const Color(0xFFFFF8E7) : outline;

  static Color get secondaryText =>
      appDarkMode.value ? const Color(0xFFD1D7E0) : const Color(0xFF4A4A4A);

  static Color get pageBackground => appDarkMode.value ? darkBackground : cream;

  static Color get surface => appDarkMode.value ? darkSurface : paper;

  static Color get panel => appDarkMode.value ? darkPanel : panelBlue;

  static Color get panelText =>
      appDarkMode.value ? const Color(0xFFFFF8E7) : outline;

  static Color get mutedText =>
      appDarkMode.value ? const Color(0xFFBFC9D6) : const Color(0xFF4A4A4A);

  static Color onColor(Color background) =>
      background.computeLuminance() < 0.4 ? paper : outline;

  static const Color darkOutline = Color(0xFF070B12);
}

// Status mode tampilan yang digunakan bersama oleh aplikasi.
final ValueNotifier<bool> appDarkMode = ValueNotifier<bool>(false);
