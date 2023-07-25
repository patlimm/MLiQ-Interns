import 'package:flutter/material.dart';
import 'package:mliq/theme/app_colors.dart';

// Reference in implementuing this theme -Wrn
// https://m2.material.io/design/color/

class AppThemeData with AppColors {
  // To access theme data use Theme.of(context)
  // e.g.
  // const primaryColor = Theme.of(context).colorScheme.primary
  // const disabledColor = Theme.of(context).disabledColor
  // You can also use the mixin AppColors
  // see theme/app_colors.dart
  // -Wrn

  ThemeData lightTheme() {
    final primaryColor = primarySwatch.shade500;
    final primaryVariant = primarySwatch.shade700;

    final secondaryColor = secondarySwatch.shade500;
    final secondaryVariant = primarySwatch.shade700;

    const disabledColor = Color(0xFFBABFC4);
    const backgroundColor = Color(0xFF121212);
    const errorColor = Color(0xFFB00020);

    return ThemeData(
      brightness: Brightness.light,
      fontFamily: 'Poppins',
      primarySwatch: primarySwatch,
      disabledColor: disabledColor,
      backgroundColor: backgroundColor,
      focusColor: secondaryColor,
      errorColor: errorColor,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: primaryColor,
        primaryContainer: primaryVariant,
        secondary: secondaryColor,
        secondaryContainer: secondaryVariant,
        background: backgroundColor,
        error: errorColor,
      ),
    );
  }

  ThemeData darkTheme() {
    final primaryColor = darkSwatch.shade500;
    final primaryVariant = darkSwatch.shade700;

    final secondaryColor = secondarySwatch.shade500;
    final secondaryVariant = primarySwatch.shade500;

    const disabledColor = Color(0xFFBABFC4);
    const backgroundColor = Color(0xFF121212);
    const errorColor = Color(0xFFCF6679);

    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: 'Poppins',
      primarySwatch: darkSwatch,
      errorColor: errorColor,
      disabledColor: disabledColor,
      colorScheme: ColorScheme.dark(
        brightness: Brightness.dark,
        primary: primaryColor,
        primaryContainer: primaryVariant,
        secondary: secondaryColor,
        secondaryContainer: secondaryVariant,
        background: backgroundColor,
        error: errorColor,
      ),
    );
  }
}
