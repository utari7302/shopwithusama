import 'package:flutter/material.dart';
import 'package:shopwithusama/common/widgets/images/u_rounded_image.dart';
import 'package:shopwithusama/common/widgets/text/product_title_text.dart';
import 'package:shopwithusama/common/widgets/text/u_brand_title_text_with_verification_icon.dart';
import 'package:shopwithusama/features/shop/models/cart_item_model.dart';
import 'package:shopwithusama/utils/constants/colors.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/helpers/helper_functions.dart';

class UCartItem extends StatelessWidget {
  const UCartItem({
    super.key,
    required this.cartItem,
  });

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        URoundedImage(
          imageUrl: cartItem.image ?? '',
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(USizes.sm),
          backgroundColor: UHelperFunctions.isDarkMode(context)
              ? UColors.darkerGrey
              : UColors.light,
          isNetworkImage: true,
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
              UBrandTitleWithVerification(title: cartItem.brandName ?? ''),
              Flexible(
                  child: UProductTitleText(
                title: cartItem.title,
                maxLines: 1,
              )),
              Text.rich(
                TextSpan(
                  children: (cartItem.selectedVariation ?? {})
                      .entries
                      .map(
                        (e) => TextSpan(children: [
                          TextSpan(
                              text: ' ${e.key} ',
                              style: Theme.of(context).textTheme.bodySmall),
                          TextSpan(
                              text: '${e.value} ',
                              style: Theme.of(context).textTheme.bodyLarge)
                        ]),
                      )
                      .toList(),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
