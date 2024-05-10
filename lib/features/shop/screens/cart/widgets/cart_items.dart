import 'package:flutter/material.dart';
import 'package:shopwithusama/common/widgets/products/cart/add_remove_button.dart';
import 'package:shopwithusama/common/widgets/products/cart/cart_item.dart';
import 'package:shopwithusama/common/widgets/products/product_cards/product_price_text.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';

class UCartItems extends StatelessWidget {
  const UCartItems({
    super.key,
    this.showAddRemoveButton = true,
  });

  final bool showAddRemoveButton;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 2,
      separatorBuilder: (_, __) => const SizedBox(
        height: USizes.spaceBtwSections,
      ),
      itemBuilder: (_, index) => Column(
        children: [
          const UCartItem(),

          if (showAddRemoveButton)
            const SizedBox(
              height: USizes.spaceBtwItems,
            ),
          if (showAddRemoveButton)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 73,
                    ),
                    UProductQuantityWithAddRemoveButton()
                  ],
                ),
                UProductPriceText(price: '256')
              ],
            )
        ],
      ),
    );
  }
}
