import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopwithusama/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shopwithusama/utils/constants/colors.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/helpers/helper_functions.dart';

class USingleAddress extends StatelessWidget {
  const USingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return URoundedContainer(
      padding: const EdgeInsets.all(USizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress ? UColors.primary.withOpacity(0.5) : Colors.transparent,
      borderColor: selectedAddress ? Colors.transparent : dark ? UColors.darkerGrey :UColors.grey,
      margin: const EdgeInsets.only(bottom: USizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 5,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress ? dark ? UColors.light : UColors.dark.withOpacity(0.6) : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Muhammad Usama',maxLines: 1,overflow: TextOverflow.ellipsis,style: Theme.of(context).textTheme.titleLarge,),
              const SizedBox(height: USizes.sm / 2,),
              const Text('+92 3214846448',maxLines: 1,overflow: TextOverflow.ellipsis,),
              const SizedBox(height: USizes.sm / 2,),
              const Text('70 A Pak Block Allama Iqbal Town Lahore',softWrap: true,),

            ],
          )
        ],
      ),
    );
  }
}
