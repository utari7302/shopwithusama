import 'package:flutter/material.dart';
import 'package:shopwithusama/utils/theme/custom_themes/appbar_theme.dart';
import 'package:shopwithusama/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:shopwithusama/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:shopwithusama/utils/theme/custom_themes/chip_theme.dart';
import 'package:shopwithusama/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:shopwithusama/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:shopwithusama/utils/theme/custom_themes/text_field_theme.dart';
import 'package:shopwithusama/utils/theme/custom_themes/text_theme.dart';

class UAppTheme {
  UAppTheme._(); // Private constructor

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      // Most important properties to differentiate b/w theme mode
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: UAppBarTheme.lightAppBarTheme,
      bottomSheetTheme: UBottomSheetTheme.lightBottomSheetTheme,
      checkboxTheme: UCheckBoxTheme.lightCheckBoxTheme,
      chipTheme: UChipTheme.lightChipThemeData,
      elevatedButtonTheme: UElevatedButtonTheme.lightElevatedButtonTheme,
      outlinedButtonTheme: UOutlinedButtonTheme.lightOutlinedButtonTheme,
      inputDecorationTheme: UTextFormFieldTheme.lightTextFormFieldTheme,
      textTheme: UTextTheme.lightTextTheme,
  );
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      // Most important properties to differentiate b/w theme mode
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: UAppBarTheme.darkAppBarTheme,
      bottomSheetTheme: UBottomSheetTheme.darkBottomSheetTheme,
      checkboxTheme: UCheckBoxTheme.darkCheckBoxTheme,
      chipTheme: UChipTheme.darkChipThemeData,
      elevatedButtonTheme: UElevatedButtonTheme.darkElevatedButtonTheme,
      outlinedButtonTheme: UOutlinedButtonTheme.darkOutlinedButtonTheme,
      inputDecorationTheme: UTextFormFieldTheme.darkTextFormFieldTheme,
      textTheme: UTextTheme.darkTextTheme,
  );
}
