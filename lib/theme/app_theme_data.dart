import 'package:flutter/material.dart';
import 'package:mliq/theme/app_colors.dart';

// Reference in implementuing this theme -Wrn
// https://m2.material.io/design/color/

// To access theme data use Theme.of(context)
// e.g.
// const primaryColor = Theme.of(context).colorScheme.primary
// const disabledColor = Theme.of(context).disabledColor
// You can also use the mixin AppColors
// see theme/app_colors.dart
// -Wrn
class AppThemeData with AppColorsMixin {
  ThemeData get lightTheme => _lightTheme();
  ThemeData get darkTheme => _darkTheme();

  ThemeData _lightTheme() {
    final primaryColor = primarySwatch.shade500;
    final primaryVariant = primarySwatch.shade700;

    final secondaryColor = secondarySwatch.shade500;
    final secondaryVariant = primarySwatch.shade700;

    const disabledColor = Color(0xFFBABFC4);
    const backgroundColor = Color(0xFF121212);
    const errorColor = Color(0xFFB00020);

    // TextTheme sampleTextTheme = ThemeData.light().textTheme.copyWith(
    //       titleMedium: TextStyle(
    //         fontWeight: FontWeight.bold,
    //         fontSize: 24,
    //         color: primaryColor,
    //       ),
    //     );

    return ThemeData(
      brightness: Brightness.light,
      fontFamily: 'Poppins',
      disabledColor: disabledColor,
      focusColor: secondaryColor,
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(
            primary: primaryColor,
            primaryContainer: primaryVariant,
            secondary: secondaryColor,
            secondaryContainer: secondaryVariant,
            background: backgroundColor,
            error: errorColor,
          )
          .copyWith(background: backgroundColor)
          .copyWith(error: errorColor),
    );
  }

  ThemeData _darkTheme() {
    final primaryColor = darkSwatch.shade500;
    final primaryVariant = darkSwatch.shade700;

    final secondaryColor = secondarySwatch.shade500;
    final secondaryVariant = primarySwatch.shade500;

    const disabledColor = Color(0xFFBABFC4);
    const errorColor = Color(0xFFCF6679);

    // TextTheme sampleTextTheme = ThemeData.light().textTheme.copyWith(
    //       titleMedium: TextStyle(
    //         fontWeight: FontWeight.bold,
    //         fontSize: 24,
    //         color: primaryColor,
    //       ),
    //     );

    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: 'Poppins',
      disabledColor: disabledColor,
      colorScheme: ColorScheme.dark(
        brightness: Brightness.dark,
        primary: primaryColor,
        primaryContainer: primaryVariant,
        secondary: secondaryColor,
        secondaryContainer: secondaryVariant,
        background: appBackgroundColor,
        error: errorColor,
      ),
      scaffoldBackgroundColor:
          appBackgroundColor, // Use the custom app background color for the scaffold
      appBarTheme: AppBarTheme(
        backgroundColor:
            navBarColor, // Use the custom nav bar color for app bar
      ),
      cardColor: cardColor, // Use the custom card color
    );
  }
}
