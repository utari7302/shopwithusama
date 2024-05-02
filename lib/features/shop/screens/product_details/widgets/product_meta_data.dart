import 'package:flutter/material.dart';
import 'package:shopwithusama/common/widgets/images/u_circular_image.dart';
import 'package:shopwithusama/common/widgets/products/product_cards/product_price_text.dart';
import 'package:shopwithusama/common/widgets/text/product_title_text.dart';
import 'package:shopwithusama/common/widgets/text/u_brand_title_text_with_verification_icon.dart';
import 'package:shopwithusama/utils/constants/colors.dart';
import 'package:shopwithusama/utils/constants/enums.dart';
import 'package:shopwithusama/utils/constants/image_strings.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';

class UProductMetaData extends StatelessWidget {
  const UProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sale Price
        Row(
            children: [
              /// Sale Tag
              URoundedContainer(
                radius: USizes.sm,
                backgroundColor: UColors.secondary.withOpacity(0.8),
                padding: const EdgeInsets.symmetric(
                    horizontal: USizes.sm, vertical: USizes.xs),
                child: Text(
                  '25%',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: UColors.black),
                ),
              ),
              const SizedBox(width: USizes.spaceBtwItems,),

              /// Price
              Text('\$250',style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
              const SizedBox(width: USizes.spaceBtwItems,),
              const UProductPriceText(price: '175',isLarge: true,)
            ],
        ),
        const SizedBox(height: USizes.spaceBtwItems / 1.5,),
        /// Title
        const UProductTitleText(title: 'Green Jordan Sports Shoes'),
        const SizedBox(height: USizes.spaceBtwItems / 1.5,),
        /// Stock Status
        Row(
          children: [
            const UProductTitleText(title: 'Status'),
            const SizedBox(height: USizes.spaceBtwItems,),
            Text('In Stock',style: Theme.of(context).textTheme.titleMedium,)
          ],
        ),
        const SizedBox(height: USizes.spaceBtwItems / 1.5,),
        /// Brand
        Row(
          children: [
            UCircularImage(image: UImages.sportIcon,width: 32,height: 32,overlayColor: dark ? UColors.white : UColors.black),
            const Expanded(child: UBrandTitleWithVerification(title: 'Nike', brandTextSize: TextSizes.medium,))
          ],
        )

      ],
    );
  }
}
