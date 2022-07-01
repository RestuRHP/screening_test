import 'package:flutter/material.dart';
import 'package:sm_test/common/resources/colors.dart';

class AppTheme{
  AppTheme._();

  static ThemeData get light =>ThemeData(
    scaffoldBackgroundColor:ResColor.white,
    appBarTheme: const AppBarTheme(
      elevation: 1,
      backgroundColor: ResColor.white,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        color: ResColor.primary
      )
    ),
    textTheme: const TextTheme(
        bodyText2: TextStyle(
          color: ResColor.black,
          fontWeight: FontWeight.normal,
          fontSize: 14,
        ),
        subtitle1: TextStyle(
          color: ResColor.black,
          fontWeight: FontWeight.normal,
          fontSize: 14,
        )
    )
  );

}