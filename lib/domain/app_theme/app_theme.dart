import 'package:flutter/material.dart';
import 'package:spliters/domain/constants/app_colors.dart';

final isLightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.light(
    brightness: Brightness.light,
    primary: AppColors.lightPrimaryColor,
    onPrimary: Colors.black,
    surface: AppColors.lightBgColor,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontFamily: "outfit",
      fontWeight: FontWeight.normal,
      fontSize: 22,
    ),
    bodyMedium: TextStyle(
      fontFamily: "outfit",
      fontWeight: FontWeight.w400,
      fontSize: 17,
    ),
    bodySmall: TextStyle(
      fontFamily: "outfit",
      fontWeight: FontWeight.w200,
      fontSize: 11,
    ),
  ),
);
final isDarkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.light(
    brightness: Brightness.dark,
    primary: AppColors.darkPrimaryColor,
    surface: AppColors.darkSurfaceColor,
    primaryContainer: AppColors.darkPrimaryContainerColor,
    secondaryContainer: AppColors.darkOnPrimaryContainerColor,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontFamily: "outfit",
      fontWeight: FontWeight.normal,
      fontSize: 22,
    ),
    bodyMedium: TextStyle(
      fontFamily: "outfit",
      fontWeight: FontWeight.w400,
      fontSize: 17,
    ),
    bodySmall: TextStyle(
      fontFamily: "outfit",
      fontWeight: FontWeight.w200,
      fontSize: 11,
    ),
  ),
);
