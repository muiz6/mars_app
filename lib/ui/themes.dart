import 'package:flutter/material.dart';

abstract class Themes {
  static final ThemeData DEFAULT_THEME = ThemeData.from(
    colorScheme: ColorScheme.dark(
      primary: _Colors.COLOR_BLUE_800,
      background: _Colors.COLOR_BLUE_900,
      surface: _Colors.COLOR_BLUE_800,
      secondary: _Colors.COLOR_BLUE_500,
    ),
  );

  /// Theme containing all the common elements
  static ThemeData baseTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}

abstract class _Colors {
  static final Color COLOR_BLUE_900 = Color(0xff22223f);
  static final Color COLOR_BLUE_800 = Color(0xff1c2755);
  static final Color COLOR_BLUE_500 = Color(0xff3658d7);
}
