import 'package:flutter/material.dart';

class UChipTheme{
  UChipTheme._();

  static ChipThemeData lightChipThemeData = ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: Colors.black),
    selectedColor: Colors.blue,
    padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 12.0),
    checkmarkColor: Colors.white
  );

  static ChipThemeData darkChipThemeData = ChipThemeData(
      disabledColor: Colors.grey.withOpacity(0.4),
      labelStyle: const TextStyle(color: Colors.white),
      selectedColor: Colors.blue,
      padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 12.0),
      checkmarkColor: Colors.white
  );
}