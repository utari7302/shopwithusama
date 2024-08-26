import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopwithusama/common/widgets/appbar/appbar.dart';
import 'package:shopwithusama/common/widgets/icons/u_circular_icon.dart';
import 'package:shopwithusama/common/widgets/layouts/grid_layout.dart';
import 'package:shopwithusama/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:shopwithusama/features/shop/screens/home/home.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';

import '../../models/product.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          UCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(const HomeScreen()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(USizes.defaultSpace),
              child: UGridLayout(itemCount: 6, itemBuilder: (_, index) {
                return UProductCardVertical(product: ProductModel.empty());
              },),
            )
          ],
        ),
      ),
    );
  }
}
