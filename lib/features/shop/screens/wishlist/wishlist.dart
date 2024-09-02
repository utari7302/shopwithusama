import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopwithusama/common/widgets/appbar/appbar.dart';
import 'package:shopwithusama/common/widgets/icons/u_circular_icon.dart';
import 'package:shopwithusama/common/widgets/layouts/grid_layout.dart';
import 'package:shopwithusama/common/widgets/loaders/animation_loader.dart';
import 'package:shopwithusama/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:shopwithusama/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:shopwithusama/features/shop/controllers/product/favourite_controller.dart';
import 'package:shopwithusama/features/shop/screens/home/home.dart';
import 'package:shopwithusama/navigation_menu.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/helpers/cloud_helper_function.dart';

import '../../../../utils/constants/image_strings.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouriteController.instance;
    return Scaffold(
      appBar: UAppBar(
        title: Text(
          'Wishlist',
          style: Theme
              .of(context)
              .textTheme
              .headlineMedium,
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
              child: FutureBuilder(
                  future: controller.favoriteProducts(),
                  builder: (context, snapshot) {

                    /// Nothing found widget
                    final emptyWidget = UAnimationLoaderWidget(
                      text: 'Whoops! Wishlist is empty...',
                      animation: UImages.docerAnimation,
                      showAction: true,
                      actionText: 'Let\'s add some',
                      onActionPressed: () =>
                          Get.off(() => const NavigationMenu()),
                    );
                    const loader = UVerticalProductShimmer(itemCount: 6);
                    final widget = UCloudHelperFunction.checkMultiRecordState(
                        snapshot: snapshot,
                        loader: loader,
                        nothingFound: emptyWidget);
                    if (widget != null) return widget;

                    final products = snapshot.data!;

                    return UGridLayout(
                      itemCount: controller.favorites.length,
                      itemBuilder: (_, index) {
                        return UProductCardVertical(
                            product: products[index]);
                      },
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
