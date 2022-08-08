import 'package:flutter/material.dart';

import '../resources/colors.dart';

class AppTheme {

  static ThemeData get light => ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: AppColors.primary,
    backgroundColor: Colors.white,
    fontFamily: 'Poppins',
    appBarTheme: appBarTheme,
    textTheme: textTheme
  );

  static AppBarTheme get appBarTheme => const AppBarTheme(
    elevation: 0,
    titleSpacing: 0,
    backgroundColor: AppColors.primary,
    titleTextStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontFamily: 'Poppins',
      color: Colors.white
    ),
    iconTheme: IconThemeData(
      color: Colors.white
    )
  );

  static TextTheme get textTheme => const TextTheme(
    bodyText2: TextStyle(
      color: AppColors.black,
      fontWeight: FontWeight.normal,
      fontSize: 14,
      fontFamily: 'Poppins',
      locale: Locale('id', 'ID')
    ),
    subtitle1: TextStyle(
      color: AppColors.black,
      fontWeight: FontWeight.normal,
      fontSize: 14,
      fontFamily: 'Poppins',
      locale: Locale('id', 'ID')
    )
  );

}