import 'package:flutter/material.dart';

// Reference in generating these colors -Wrn
// http://mcg.mbitson.com/

// You may add this mixin to your Widgets using the "with" keyword
// e.g. class MyClass with AppColors {}
// to be able access its getters within your Widgets
// with this you can access the color shades from 50 to 900
// i.e. get primarySwatch / get secondarySwatch
// e.g. Container(color: primarySwatch.shade500);
// Note: It's still recommended to access Colors via Theme.of(context)
// -Wrn

mixin AppColorsMixin {
  static const int _primaryValue = 0xFFFF7412;
  static const int _secondaryValue = 0xFF10A3D0;
  static const int _darkValue = 0xFFFFBA89;

  MaterialColor get primarySwatch => _primarySwatch();

  MaterialColor get secondarySwatch => _secondarySwatch();

  MaterialColor get darkSwatch => _darkSwatch();

  static MaterialColor get primarySwatchExtension => _primarySwatch();
  static MaterialColor get darkSwatchExtension => _darkSwatch();

  // Material Color Swatches

  // Light Theme primary color swatch
  static MaterialColor _primarySwatch() => const MaterialColor(
        _primaryValue,
        <int, Color>{
          50: Color(0xFFFFEEE3),
          100: Color(0xFFFFD5B8),
          200: Color(0xFFFFBA89),
          300: Color(0xFFFF9E59),
          400: Color(0xFFFF8936),
          500: Color(_primaryValue),
          600: Color(0xFFFF6C10),
          700: Color(0xFFFF610D),
          800: Color(0xFFFF570A),
          900: Color(0xFFFF4405),
        },
      );

  // Dark Theme primary color swatch
  static MaterialColor _darkSwatch() => const MaterialColor(
        _darkValue,
        <int, Color>{
          50: Color(0xFFFFF7F1),
          100: Color(0xFFFFEADC),
          200: Color(0xFFFFDDC4),
          300: Color(0xFFFFCFAC),
          400: Color(0xFFFFC49B),
          500: Color(_darkValue),
          600: Color(0xFFFFB381),
          700: Color(0xFFFFAB76),
          800: Color(0xFFFFA36C),
          900: Color(0xFFFF9459),
        },
      );

  // Secondary Colors
  static MaterialColor _secondarySwatch() => const MaterialColor(
        _secondaryValue,
        <int, Color>{
          50: Color(0xFFE2F4F9),
          100: Color(0xFFB7E3F1),
          200: Color(0xFF88D1E8),
          300: Color(0xFF58BFDE),
          400: Color(0xFF34B1D7),
          500: Color(_secondaryValue),
          600: Color(0xFF0E9BCB),
          700: Color(0xFF0C91C4),
          800: Color(0xFF0988BE),
          900: Color(0xFF0577B3),
        },
      );
}
