import 'package:flutter/material.dart';

class UCheckBoxTheme{
  UCheckBoxTheme._();
  
  static CheckboxThemeData lightCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    fillColor: WidgetStateColor.resolveWith((states) {
      if(states.contains(WidgetState.selected)){
        return Colors.blue;
      }else{
        return Colors.white;
      }
    }),
    checkColor: WidgetStateColor.resolveWith((states) {
      if(states.contains(WidgetState.selected)){
        return Colors.white;
      }else{
        return Colors.transparent;
      }
    }),
  );


  static CheckboxThemeData darkCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    fillColor: WidgetStateColor.resolveWith((states) {
      if(states.contains(WidgetState.selected)){
        return Colors.white;
      }else{
        return Colors.black;
      }
    }),
    checkColor: WidgetStateColor.resolveWith((states) {
      if(states.contains(WidgetState.selected)){
        return Colors.blue;
      }else{
        return Colors.transparent;
      }
    }),
  );
}