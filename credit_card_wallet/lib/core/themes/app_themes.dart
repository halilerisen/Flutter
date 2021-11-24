import 'package:flutter/material.dart';

class AppThemes {
  static const Color kLoginBackgroundColor = Color(0XFFC8C3BC);

  static const Color kTextInputBackgroundColor = Color(0XFFF5F4F2);
  static const Color kLoginButtonBackgroundColor = Color(0XFF241C1C);
  static const Color kSingUpButtonBackgroundColor = Color(0xAAC8C4B7);

  static const Color kColorPrimary = Color(0xFF3829C4);

  static ThemeData appTheme = ThemeData.light().copyWith(
    primaryColor: AppThemes.kColorPrimary,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
    ),
  );
}
