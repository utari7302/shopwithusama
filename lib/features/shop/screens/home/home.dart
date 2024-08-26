import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopwithusama/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:shopwithusama/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:shopwithusama/common/widgets/layouts/grid_layout.dart';
import 'package:shopwithusama/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:shopwithusama/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:shopwithusama/common/widgets/text/section_heading.dart';
import 'package:shopwithusama/features/shop/controllers/product_controller.dart';
import 'package:shopwithusama/features/shop/screens/all_products/all_products.dart';
import 'package:shopwithusama/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:shopwithusama/features/shop/screens/home/widgets/home_categories.dart';
import 'package:shopwithusama/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:shopwithusama/utils/constants/colors.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const UPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// App Bar
                  UHomeAppBar(),

                  /// Spacing
                  SizedBox(
                    height: USizes.spaceBtwSections,
                  ),

                  /// Search Bar
                  USearchContainer(
                    text: 'Search in store',
                  ),

                  /// Spacing
                  SizedBox(
                    height: USizes.spaceBtwSections,
                  ),

                  /// Heading and Categories section
                  Padding(
                    padding: EdgeInsets.only(left: USizes.defaultSpace),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        USectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: UColors.white,
                        ),
                        SizedBox(
                          height: USizes.spaceBtwItems,
                        ),
                        UHomeCategories(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: USizes.spaceBtwSections,
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: USizes.defaultSpace),
              child: Column(
                children: [
                  const UPromoSlider(),
                  const SizedBox(
                    height: USizes.spaceBtwSections / 2,
                  ),
                  USectionHeading(
                    title: 'Popular Products',
                    showActionButton: true,
                    textColor: UColors.black,
                    onPressed: () => Get.to(() => const AllProductsScreen()),
                  ),
                  Obx(
                    () {
                      if (controller.isLoading.value)
                        return const UVerticalProductShimmer();

                      if (controller.featuredProducts.isEmpty) {
                        return Center(
                            child: Text('No Data Found!',
                                style: Theme.of(context).textTheme.bodyMedium));
                      }

                      return UGridLayout(
                          itemCount: controller.featuredProducts.length,
                          itemBuilder: (_, index) => UProductCardVertical(
                              product: controller.featuredProducts[index]));
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
