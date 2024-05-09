import 'package:flutter/material.dart';
import 'package:shopwithusama/common/widgets/appbar/appbar.dart';
import 'package:shopwithusama/common/widgets/products/cart/add_remove_button.dart';
import 'package:shopwithusama/common/widgets/products/cart/cart_item.dart';
import 'package:shopwithusama/common/widgets/products/product_cards/product_price_text.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(
        title: Text(
          'Add To Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(USizes.defaultSpace),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: 10,
          separatorBuilder: (_, __) => const SizedBox(
            height: USizes.spaceBtwSections,
          ),
          itemBuilder: (_, index) => const Column(
            children: [
              UCartItem(),
              SizedBox(height: USizes.spaceBtwItems,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 73,),
                      UProductQuantityWithAddRemoveButton()
                    ],
                  ),
                  UProductPriceText(price: '256')

                ],
              )

            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(USizes.defaultSpace),
        child: ElevatedButton(onPressed: () {

        },child: const Text('Checkout \$256.0'),),
      ),
    );
  }
}




