import 'package:event_planing/utilies/app%20colors.dart';
import 'package:event_planing/utilies/fonts.dart';
import 'package:flutter/material.dart';

class MyAppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.cleanwhite,
      floatingActionButtonTheme: FloatingActionButtonThemeData(

          backgroundColor: AppColors.primaryColorLight,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(75),
              side: BorderSide(color: AppColors.cleanwhite, width: 3))),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
          showUnselectedLabels: true,
          unselectedLabelStyle: AppFontStyles.White12Bold,
          selectedLabelStyle: AppFontStyles.White12Bold),
      appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: AppColors.primaryColorLight),
        backgroundColor: AppColors.primaryColorLight,
      ),
      primaryColor: AppColors.primaryColorLight);

  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.primaryColorDark,

      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColors.primaryColorDark,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(75),
              side: BorderSide(color: AppColors.cleanwhite, width: 3))),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 0,

          showUnselectedLabels: true,
          unselectedLabelStyle: AppFontStyles.White12Bold,
          selectedLabelStyle: AppFontStyles.White12Bold),
      appBarTheme: AppBarTheme(backgroundColor: AppColors.primaryColorLight,iconTheme: IconThemeData(color: AppColors.primaryColorLight)),
      primaryColor: AppColors.primaryColorDark);
}
