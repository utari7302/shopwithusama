import 'package:flutter/material.dart';

class UAppBarTheme {
  UAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black,size: 24.0,),
    actionsIconTheme: IconThemeData(color: Colors.black,size: 24.0,),
    titleTextStyle: TextStyle(fontSize: 18.0,color: Colors.black,fontWeight: FontWeight.w600)
  );

  static const darkAppBarTheme = AppBarTheme(
      elevation: 0,
      centerTitle: false,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.black,size: 24.0,),
      actionsIconTheme: IconThemeData(color: Colors.white,size: 24.0,),
      titleTextStyle: TextStyle(fontSize: 18.0,color: Colors.white,fontWeight: FontWeight.w600)
  );
}