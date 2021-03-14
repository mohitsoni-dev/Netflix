import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData light() {
    final textTheme = _getThemeBrightness(brightness: Brightness.light);
    return ThemeData(
      primaryColor: _primaryColor,
      accentColor: _accentColor,
      textTheme: textTheme,
      primaryTextTheme: textTheme,
    );
  }

  static ThemeData dark() {
    final textTheme = _getThemeBrightness(brightness: Brightness.dark);
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: _primaryColor,
      backgroundColor: _primaryColor,
      accentColor: _accentColor,
      textTheme: textTheme,
      primaryTextTheme: textTheme,
    );
  }

  static const _primaryColor = Colors.black;
  static const _accentColor = Colors.white;

  static _getThemeBrightness({@required Brightness brightness}) {
    final themeData = ThemeData(brightness: brightness);

    return GoogleFonts.notoSansTextTheme(
        themeData.textTheme); //themeData.textTheme;
  }
}
