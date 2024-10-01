import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopwithusama/common/widgets/appbar/appbar.dart';
import 'package:shopwithusama/common/widgets/loaders/animation_loader.dart';
import 'package:shopwithusama/features/shop/controllers/product/cart_controller.dart';
import 'package:shopwithusama/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:shopwithusama/features/shop/screens/checkout/checkout.dart';
import 'package:shopwithusama/navigation_menu.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';

import '../../../../utils/constants/image_strings.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Scaffold(
      appBar: UAppBar(
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: Obx(
        () {
          /// Nothing Found Widget
          final emptyWidget = UAnimationLoaderWidget(
            text: 'Whoops! Cart is empty',
            animation: UImages.productsSaleIllustration,
            showAction: true,
            actionText: 'Let\'s fill it',
            onActionPressed: () => Get.off(() => const NavigationMenu()),
          );

          if (cartController.cartItems.isEmpty) {
            return emptyWidget;
          } else {
            return const SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(USizes.defaultSpace),
                child: UCartItems(),
              ),
            );
          }
        },
      ),
      bottomNavigationBar: cartController.cartItems.isEmpty ? const SizedBox() :Padding(
        padding: const EdgeInsets.all(USizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => const CheckoutScreen()),
          child: Obx(
              () => Text('Checkout \$${cartController.totalCartPrice.value}')),
        ),
      ),
    );
  }
}
