import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopwithusama/features/shop/controllers/product/cart_controller.dart';
import 'package:shopwithusama/features/shop/models/product.dart';
import 'package:shopwithusama/features/shop/screens/product_details/product_details.dart';
import 'package:shopwithusama/utils/constants/enums.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class ProductCardAddToCartButton extends StatelessWidget {
  const ProductCardAddToCartButton({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return InkWell(
      onTap: () {
        if (product.productType == ProductType.single.toString()) {
          final cartItem = cartController.convertToCartItem(product, 1);
          cartController.addOneToCart(cartItem);
        } else {
          Get.to(()=> ProductDetailsScreen(product: product));
        }
      },
      child: Obx(() {
        final productQuantityInCart =
            cartController.getProductQuantityInCart(product.id);
        return Container(
          decoration: BoxDecoration(
              color: productQuantityInCart > 0 ? UColors.primary : UColors.dark,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(USizes.cardRadiusMd),
                bottomRight: Radius.circular(USizes.productImageRadius),
              )),
          child: SizedBox(
            width: USizes.iconLg * 1.2,
            height: USizes.iconLg * 1.2,
            child: Center(
              child: productQuantityInCart > 0
                  ? Text(
                      productQuantityInCart.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .apply(color: UColors.white),
                    )
                  : const Icon(
                      Iconsax.add,
                      color: UColors.white,
                    ),
            ),
          ),
        );
      }),
    );
  }
}
