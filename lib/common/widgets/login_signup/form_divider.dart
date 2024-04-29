import 'package:flutter/material.dart';
import 'package:shopwithusama/utils/constants/colors.dart';
import 'package:shopwithusama/utils/helpers/helper_functions.dart';

class UFormDivider extends StatelessWidget {
  const UFormDivider({
    super.key, required this.dividerText,
  });

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: Divider(thickness: 0.5, indent: 60, endIndent: 5,color: dark ? UColors.darkGrey : UColors.grey,)),
        Text(dividerText,style: Theme.of(context).textTheme.labelMedium,),
        Flexible(child: Divider(thickness: 0.5, indent: 5, endIndent: 60,color: dark ? UColors.darkGrey : UColors.grey,)),
      ],
    );
  }
}