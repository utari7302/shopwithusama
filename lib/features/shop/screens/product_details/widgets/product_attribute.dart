import 'package:flutter/material.dart';
import 'package:shopwithusama/common/widgets/chips/choice_chip.dart';
import 'package:shopwithusama/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shopwithusama/common/widgets/products/product_cards/product_price_text.dart';
import 'package:shopwithusama/common/widgets/text/product_title_text.dart';
import 'package:shopwithusama/common/widgets/text/section_heading.dart';
import 'package:shopwithusama/utils/constants/colors.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/helpers/helper_functions.dart';

class UProductAttribute extends StatelessWidget {
  const UProductAttribute({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        URoundedContainer(
          padding: const EdgeInsets.all(USizes.md),
          backgroundColor: dark ? UColors.darkerGrey : UColors.grey,
          child: Column(
            children: [
              Row(
                children: [
                  const USectionHeading(title: 'Variation',showActionButton: false,),
                  const SizedBox(width: USizes.spaceBtwItems,),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const UProductTitleText(title: 'Price : ',smallSize: true,),

                          /// Actual Price
                          Text('\$25',style: Theme.of(context).textTheme.titleMedium!.apply(decoration: TextDecoration.lineThrough),),
                          const SizedBox(width: USizes.spaceBtwItems,),

                          /// Sale Price
                          const UProductPriceText(price: '20')
                        ],
                      ),

                      /// Stock
                      Row(
                        children: [
                          const UProductTitleText(title: 'Stock : ',smallSize: true,),
                          Text('In Stock',style: Theme.of(context).textTheme.titleMedium,),
                        ],
                      )
                    ],
                  )
                ],
              ),
              
              /// Variation Description
              const UProductTitleText(title: 'This is the description of the product and it can go upto max 4 lines',smallSize: true,maxLines: 4,),
            ],
          ),
        ),

        const SizedBox(height: USizes.spaceBtwItems,),

        /// Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const USectionHeading(title: 'Colors',showActionButton: false,),
            const SizedBox(height: USizes.spaceBtwItems / 2,),
            Wrap(
              spacing: 8,
              children: [
                UChoiceChip(text: 'Green',selected: true,onSelected: (value) {},),
                UChoiceChip(text: 'Blue',selected: false,onSelected: (value) {},),
                UChoiceChip(text: 'Yellow',selected: false,onSelected: (value) {},),
              ],
            )

          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const USectionHeading(title: 'Size',showActionButton: false,),
            const SizedBox(height: USizes.spaceBtwItems / 2,),
            Wrap(
              spacing: 8,
              children: [
                UChoiceChip(text: 'EU 34',selected: false,onSelected: (value) {},),
                UChoiceChip(text: 'EU 36',selected: false,onSelected: (value) {},),
                UChoiceChip(text: 'EU 38',selected: true,onSelected: (value) {},),
              ],
            )

          ],
        )
      ],
    );
  }
}


