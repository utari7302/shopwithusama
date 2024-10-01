import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopwithusama/common/widgets/products/cart/add_remove_button.dart';
import 'package:shopwithusama/common/widgets/products/cart/cart_item.dart';
import 'package:shopwithusama/common/widgets/products/product_cards/product_price_text.dart';
import 'package:shopwithusama/features/shop/controllers/product/cart_controller.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';

class UCartItems extends StatelessWidget {
  const UCartItems({
    super.key,
    this.showAddRemoveButton = true,
  });

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Obx(() => ListView.separated(
          shrinkWrap: true,
          itemCount: cartController.cartItems.length,
          separatorBuilder: (_, __) => const SizedBox(
            height: USizes.spaceBtwSections,
          ),
          itemBuilder: (_, index) => Obx(() {
            final item = cartController.cartItems[index];
            return Column(
              children: [
                UCartItem(cartItem: item),
                if (showAddRemoveButton)
                  const SizedBox(
                    height: USizes.spaceBtwItems,
                  ),
                if (showAddRemoveButton)
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 73,
                          ),
                          UProductQuantityWithAddRemoveButton(quantity: item.quantity,add: () => cartController.addOneToCart(item),remove: () => cartController.removeOneFromCart(item),)
                        ],
                      ),
                      UProductPriceText(price: (item.price * item.quantity).toStringAsFixed(1))
                    ],
                  )
              ],
            );
          }),
        ));
  }
}
