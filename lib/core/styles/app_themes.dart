import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/constants/constants.dart';
import 'app_colors.dart';

abstract class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    colorScheme: AppColors.colorScheme,
    primarySwatch: AppColors.primarySwatch,
    textTheme: textTheme,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    appBarTheme: appBarTheme,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    iconTheme: const IconThemeData(
      color: AppColors.white,
    ),
    dividerColor: Colors.transparent,
    snackBarTheme: const SnackBarThemeData(behavior: SnackBarBehavior.floating),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 10, vertical: 13.0),
      labelStyle: textTheme.headlineSmall!.copyWith(color: AppColors.grey),
      errorStyle:
          textTheme.labelLarge!.copyWith(color: AppColors.secondarySwatch[500]),
      helperStyle:
          textTheme.bodyLarge!.copyWith(color: AppColors.formsTextGrey),
      hintStyle: textTheme.bodyLarge!.copyWith(color: AppColors.formsTextGrey),
      floatingLabelStyle:
          textTheme.bodyMedium!.copyWith(color: AppColors.primarySwatch[800]),
      fillColor: AppColors.formsGrey,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1.5, color: AppColors.formsGrey),
        borderRadius: BorderRadius.circular(radius),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(width: 1.5, color: AppColors.primarySwatch[300]!),
        borderRadius: BorderRadius.circular(radius),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide:
            BorderSide(width: 1.5, color: AppColors.primarySwatch[300]!),
        borderRadius: BorderRadius.circular(radius),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
            width: 1.5,
            color: AppColors.colorScheme.secondary.withOpacity(0.7)),
        borderRadius: BorderRadius.circular(radius),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primarySwatch[300],
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        textStyle: textTheme.bodySmall,
        fixedSize: const Size.fromWidth(double.maxFinite),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.grey,
        textStyle: textTheme.bodyMedium,
        padding: const EdgeInsets.all(2),
        side: const BorderSide(width: 1.0, color: AppColors.grey),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        fixedSize: const Size.fromWidth(double.maxFinite),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        fixedSize: const Size.fromWidth(double.maxFinite),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey),
    dialogTheme: const DialogTheme(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius))),
    ),
    radioTheme: const RadioThemeData(
      fillColor: MaterialStatePropertyAll(AppColors.primaryColor),
      overlayColor: MaterialStatePropertyAll(AppColors.grey),
    ),
  );

  static final TextTheme textTheme = TextTheme(
    headlineLarge: TextStyle(
      color: Colors.black,
      fontSize: 27.0.sp,
      fontFamily: 'DINNextLTArabic',
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: TextStyle(
      color: Colors.black,
      fontSize: 23.0.sp,
      fontFamily: 'DINNextLTArabic',
      fontWeight: FontWeight.w500,
    ),
    headlineSmall: TextStyle(
      color: Colors.black,
      fontSize: 16.0.sp,
      fontFamily: 'DINNextLTArabic',
      fontWeight: FontWeight.w500,
    ),
    titleLarge: TextStyle(
      color: Colors.black,
      fontSize: 20.0.sp,
      fontFamily: 'DINNextLTArabic',
      fontWeight: FontWeight.w500,
    ),
    titleMedium: TextStyle(
      color: Colors.black,
      fontSize: 17.0.sp,
      fontFamily: 'DINNextLTArabic',
      fontWeight: FontWeight.w500,
    ),
    titleSmall: TextStyle(
      color: Colors.black,
      fontSize: 15.0.sp,
      fontFamily: 'DINNextLTArabic',
      fontWeight: FontWeight.w400,
    ),
    bodyLarge: TextStyle(
      color: Colors.black,
      fontSize: 14.0.sp,
      fontFamily: 'DINNextLTArabic',
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      color: Colors.black,
      fontSize: 13.0.sp,
      fontFamily: 'DINNextLTArabic',
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      color: Colors.black,
      fontSize: 12.0.sp,
      fontFamily: 'DINNextLTArabic',
      fontWeight: FontWeight.w400,
    ),
    displayLarge: TextStyle(
      color: Colors.black,
      fontSize: 12.5.sp,
      fontFamily: 'DINNextLTArabic',
      fontWeight: FontWeight.w400,
    ),
    displayMedium: TextStyle(
      color: Colors.black,
      fontSize: 11.5.sp,
      fontFamily: 'DINNextLTArabic',
      fontWeight: FontWeight.w400,
    ),
    displaySmall: TextStyle(
      color: Colors.black,
      fontSize: 11.0.sp,
      fontFamily: 'DINNextLTArabic',
      fontWeight: FontWeight.w400,
    ),
    labelLarge: TextStyle(
      color: Colors.black,
      fontSize: 10.0.sp,
      fontFamily: 'DINNextLTArabic',
      fontWeight: FontWeight.w400,
    ),
    labelMedium: TextStyle(
      color: Colors.black,
      fontSize: 9.0.sp,
      fontFamily: 'DINNextLTArabic',
      fontWeight: FontWeight.w400,
    ),
    labelSmall: TextStyle(
      color: Colors.black,
      fontSize: 8.0.sp,
      fontFamily: 'DINNextLTArabic',
      fontWeight: FontWeight.w400,
    ),
  );

  static AppBarTheme appBarTheme = AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.light,
    toolbarTextStyle: const TextTheme(
      titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
    ).bodyMedium,
    // titleTextStyle: const TextTheme(
    //   headline6: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
    // ).headline6,
    titleTextStyle: const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'DINNextLTArabic',
      color: Colors.white,
    ),
    centerTitle: true,
    backgroundColor: AppColors.primaryColor,
    foregroundColor: AppColors.primarySwatch[800],
    elevation: 0,
    iconTheme: const IconThemeData(
      color: AppColors.white,
    ),
    actionsIconTheme: const IconThemeData(color: AppColors.white, size: 26),
  );
}
