// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/constants/app_colors.dart';

TextStyle globalFont = GoogleFonts.montserrat();
ThemeData defaultTheme = ThemeData(
  primaryColor: primaryColor,
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
    foregroundColor: MaterialStateProperty.all(textColor),
    minimumSize: MaterialStateProperty.all(
      Size.fromHeight(48),
    ),
    textStyle: MaterialStateProperty.resolveWith((states) {
      // If the button is pressed, return size 40, otherwise 20
      if (states.contains(MaterialState.pressed)) {
        return globalFont.copyWith(fontWeight: FontWeight.w500, fontSize: 16);
      }
      return globalFont.copyWith(fontWeight: FontWeight.w500, fontSize: 16);
    }),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24.0),
    )),
    backgroundColor: MaterialStateProperty.all(primaryColor),
  )),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.resolveWith((states) {
        // If the button is pressed, return size 40, otherwise 20
        if (states.contains(MaterialState.pressed)) {
          return globalFont.copyWith(fontWeight: FontWeight.w500);
        }
        return globalFont.copyWith(fontWeight: FontWeight.w500);
      }),
      foregroundColor: MaterialStateProperty.all(primaryColor),
      // fixedSize: MaterialStateProperty.all(
      //   Size.fromHeight(6),
      // ),
    ),
  ),
  tabBarTheme: TabBarTheme(
      labelStyle: TextStyle(fontSize: 16),
      unselectedLabelStyle: TextStyle(fontSize: 16)),
  scaffoldBackgroundColor: scaffoldBackgroundColor,
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: iconColor),
    backgroundColor: appbarBackgroundColor,
    titleTextStyle: globalFont,
  ),
  textTheme: TextTheme(
    displayLarge:
        globalFont.copyWith(fontSize: 24, fontWeight: FontWeight.w600),
    displayMedium:
        globalFont.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
    displaySmall:
        globalFont.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
    headlineMedium:
        globalFont.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
    headlineSmall:
        globalFont.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
    headlineLarge:
        globalFont.copyWith(fontSize: 18, fontWeight: FontWeight.w600),
    titleLarge: globalFont.copyWith(fontSize: 22, fontWeight: FontWeight.w600),
    titleMedium: globalFont,
    titleSmall: globalFont,
    bodyLarge: globalFont,
    bodyMedium: globalFont.copyWith(fontSize: 16),
    labelLarge: globalFont,
    bodySmall: globalFont.copyWith(fontSize: 14),
  ),
  iconTheme: IconThemeData(color: iconColor),
  primaryIconTheme: IconThemeData(color: iconColor),
);
