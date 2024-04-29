import 'package:flutter/material.dart';
import 'package:shopwithusama/common/widgets/brands/brand_card.dart';
import 'package:shopwithusama/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shopwithusama/utils/constants/colors.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/helpers/helper_functions.dart';

class UBrandShowCase extends StatelessWidget {
  const UBrandShowCase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return URoundedContainer(
      showBorder: true,
      borderColor: UColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: USizes.spaceBtwItems),
      padding: const EdgeInsets.all(USizes.md),
      child: Column(
        children: [
          /// Brand with product count
          const UBrandCard(
            showBorder: false,
          ),

          /// Brand top 3 product images
          Row(
            children: images.map((image) => brandTopProductImageWidth(image, context)).toList(),
          )
        ],
      ),
    );
  }

  Widget brandTopProductImageWidth(String image, context) {
    return Expanded(
        child: URoundedContainer(
          height: 100,
          backgroundColor: UHelperFunctions.isDarkMode(context) ? UColors.darkerGrey : UColors.light,
          margin: const EdgeInsets.only(right: USizes.sm),
          padding: const EdgeInsets.all(USizes.md),
          child: Image(
            fit: BoxFit.contain,
            image: AssetImage((image)),
          ),
        ));
  }
}
