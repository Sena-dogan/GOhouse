import 'package:flutter/material.dart';

import 'app_theme.dart';

class AppColors {
  AppColors._(); // this basically makes it so you can't instantiate this class

  static const Map<int, Color> orange = const <int, Color>{
    50: const Color(0xFFFCF2E7),
    100: const Color(0xFFF8DEC3),
    200: const Color(0xFFF3C89C),
    300: const Color(0xFFEEB274),
    400: const Color(0xFFEAA256),
    500: const Color(0xFFE69138),
    600: const Color(0xFFE38932),
    700: const Color(0xFFDF7E2B),
    800: const Color(0xFFDB7424),
    900: const Color(0xFFD56217)
  };
}

class MenuColors {
  MenuColors._();
  static final primaryColor = Color(0xFF685BFF),
      canvasColor = Color(0xFF2E2E48),
      scaffoldBackgroundColor = Color(0xFF464667),
      accentCanvasColor = Color(0xFF3E3E61),
      white = Colors.white,
      yellow = Color.fromARGB(255, 221, 210, 4),
      midnightGreenEagleGreen = Color(0xFF074F57),
      midnightGreenEagleGreen2 = Color.fromARGB(170, 7, 79, 87),
      tealBlue = Color(0xFF077187),
      mustard = Color(0xFFFFDD4A),
      shinyShamrock = Color(0xFF74A57F),
      princetonOrange = Color(0xFFFA8334),
      actionColor = AppThemeData.lightColorScheme.primary;
}
