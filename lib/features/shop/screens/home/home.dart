import 'package:flutter/material.dart';
import 'package:shopwithusama/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:shopwithusama/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:shopwithusama/common/widgets/layouts/grid_layout.dart';
import 'package:shopwithusama/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:shopwithusama/common/widgets/text/section_heading.dart';
import 'package:shopwithusama/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:shopwithusama/features/shop/screens/home/widgets/home_categories.dart';
import 'package:shopwithusama/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:shopwithusama/utils/constants/colors.dart';
import 'package:shopwithusama/utils/constants/image_strings.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: USizes.defaultSpace),
              child: Column(
                children: [
                  const UPromoSlider(banners: [UImages.promoBanner1,UImages.promoBanner2,UImages.promoBanner3,UImages.promoBanner4],),
                  const SizedBox(
                    height: USizes.spaceBtwSections / 2,
                  ),

                  const USectionHeading(
                    title: 'Popular Products',
                    showActionButton: true,
                    textColor: UColors.black,
                  ),

                  UGridLayout( itemCount: 2, itemBuilder: (_, index) => const UProductCardVertical(),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}