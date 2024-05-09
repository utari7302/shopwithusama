import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopwithusama/common/widgets/icons/u_circular_icon.dart';
import 'package:shopwithusama/utils/constants/colors.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/helpers/helper_functions.dart';

class UProductQuantityWithAddRemoveButton extends StatelessWidget {
  const UProductQuantityWithAddRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        UCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: USizes.md,
          color: UHelperFunctions.isDarkMode(context) ? UColors.white : UColors.black,
          backgroundColor: UHelperFunctions.isDarkMode(context) ? UColors.darkerGrey : UColors.light,
        ),
        const SizedBox(width: USizes.spaceBtwItems,),
        Text('2',style: Theme.of(context).textTheme.titleSmall,),
        const SizedBox(width: USizes.spaceBtwItems,),
        const UCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: USizes.md,
          color: UColors.white,
          backgroundColor: UColors.primary,
        ),
      ],
    );
  }
}