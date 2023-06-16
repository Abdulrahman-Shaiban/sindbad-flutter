import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class AppColors {
  late Ref ref;

  AppColors({required this.ref});

  static const Color primaryColor = Color(0XFF395F9E);
  static const Color backgroundColor = Color(0XFFF9F9F9);
  static const Color dividerColor = Color(0XFFc0dfe2);
  static const Color black = Color(0XFF000100);
  static const Color lightBlack = Color(0xAA000000);
  static const Color orange = Color(0XFFF9B04A);
  static const Color grey = Colors.black26;
  static const Color lightGrey = Colors.black12;
  static const Color formsGrey = Color(0XFFF2F2F2);
  static const Color formsTextGrey = Color(0XFFB6B7B7);
  static const Color white = Colors.white;

  static ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: primaryColor,
    primaryContainer: primaryColor,
    secondary: secondarySwatch[500],
    secondaryContainer: secondarySwatch[500],
    onSecondary: Colors.white,
    onSurface: primaryColor,
    background: backgroundColor,
    onBackground: backgroundColor,
    brightness: Brightness.light,
  );

  static ColorScheme darkColorScheme = const ColorScheme.light().copyWith(
    primary: primaryColor,
    primaryContainer: primaryColor,
    secondary: secondarySwatch[500],
    secondaryContainer: secondarySwatch[500],
    onSecondary: Colors.black,
    onSurface: primaryColor,
    background: Colors.black,
    onBackground: Colors.black,
    brightness: Brightness.dark,
  );

  static const MaterialColor primarySwatch = MaterialColor(
    0XFF395f9e,
    <int, Color>{
      50: Color(0xFF889fc4),
      100: Color(0xFF748fbb),
      200: Color(0xFF607eb1),
      300: Color(0xFF557DBE),
      400: Color(0xFF4c6fa7),
      500: Color(0XFF395f9e),
      600: Color(0xFF33558e),
      700: Color(0xFF2d4c7e),
      800: Color(0xFF27426e),
      900: Color(0xFF22395e),
    },
  );

  static const MaterialColor secondarySwatch = MaterialColor(
    0XFFE43427,
    <int, Color>{
      50: Color(0xFFf19993),
      100: Color(0xFFee857d),
      200: Color(0xFFec7067),
      300: Color(0xFFe95c52),
      400: Color(0xFFe6483c),
      500: Color(0XFFE43427),
      600: Color(0xFFcd2e23),
      700: Color(0xFFb6291f),
      800: Color(0xFF9f241b),
      900: Color(0xFF881f17),
    },
  );
}
