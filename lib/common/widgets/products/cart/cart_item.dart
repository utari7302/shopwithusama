import 'package:flutter/material.dart';
import 'package:shopwithusama/common/widgets/images/u_rounded_image.dart';
import 'package:shopwithusama/common/widgets/text/product_title_text.dart';
import 'package:shopwithusama/common/widgets/text/u_brand_title_text_with_verification_icon.dart';
import 'package:shopwithusama/utils/constants/colors.dart';
import 'package:shopwithusama/utils/constants/image_strings.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/helpers/helper_functions.dart';

class UCartItem extends StatelessWidget {
  const UCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        URoundedImage(
          imageUrl: UImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(USizes.sm),
          backgroundColor: UHelperFunctions.isDarkMode(context)
              ? UColors.darkerGrey
              : UColors.light,
        ),
        const SizedBox(
          width: USizes.spaceBtwItems,
        ),

        /// Title, Price & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UBrandTitleWithVerification(title: 'Nike'),
              const Flexible(child: UProductTitleText(title: 'Black Sports Shoes',maxLines: 1,)),
              Text.rich(
                  TextSpan(
                      children: [
                        TextSpan(text: 'Color ',style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: 'Green ',style: Theme.of(context).textTheme.bodyLarge),
                        TextSpan(text: 'Size ',style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: 'UK 08 ',style: Theme.of(context).textTheme.bodyLarge),
                      ]
                  )
              )
            ],
          ),
        )
      ],
    );
  }
}