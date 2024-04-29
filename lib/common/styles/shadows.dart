import 'package:flutter/cupertino.dart';
import 'package:shopwithusama/utils/constants/colors.dart';

class UShadowStyle{

  static final verticalProductShadow = BoxShadow(
    color: UColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0,2)
  );

  static final horizontalProductShadow = BoxShadow(
      color: UColors.darkGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0,2)
  );

}