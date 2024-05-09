import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopwithusama/common/widgets/icons/u_circular_icon.dart';
import 'package:shopwithusama/utils/constants/colors.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/helpers/helper_functions.dart';

class UBottomAddToCart extends StatelessWidget {
  const UBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace,vertical: USizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? UColors.darkerGrey : UColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(USizes.cardRadiusLg),
          topRight: Radius.circular(USizes.cardRadiusLg),
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const UCircularIcon(
                  icon: Iconsax.minus,
                backgroundColor: UColors.darkGrey,
                width: 40,
                height: 40,
                color: UColors.white,
              ),
              const SizedBox(width: USizes.spaceBtwItems,),
              Text('2',style: Theme.of(context).textTheme.titleSmall,),
              const SizedBox(width: USizes.spaceBtwItems,),
              const UCircularIcon(
                icon: Iconsax.add,
                backgroundColor: UColors.black,
                width: 40,
                height: 40,
                color: UColors.white,
              ),
            ],
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(USizes.md),
                backgroundColor: UColors.black,
                side: const BorderSide(color: UColors.black)
              ),
              onPressed: () {

          }, child: const Text('Add to Cart'))
        ],
      ),
    );
  }
}
