import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:shopwithusama/common/widgets/text/section_heading.dart';
import 'package:shopwithusama/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:shopwithusama/features/shop/screens/product_details/widgets/product_attribute.dart';
import 'package:shopwithusama/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:shopwithusama/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:shopwithusama/features/shop/screens/product_details/widgets/rating_share.dart';
import 'package:shopwithusama/features/shop/screens/product_reviews/product_review.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/helpers/helper_functions.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const UBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const UProductImageSlider(),
            Padding(
              padding: const EdgeInsets.only(
                right: USizes.defaultSpace,
                left: USizes.defaultSpace,
                bottom: USizes.defaultSpace,
              ),
              child: Column(
                children: [
                  /// Rating
                  const URatingAndShare(),

                  /// Price, Title, Stock & Brand
                  const UProductMetaData(),

                  /// Attributes
                  const UProductAttribute(),

                  const SizedBox(
                    height: USizes.spaceBtwSections,
                  ),

                  /// Checkout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('Checkout')),
                  ),
                  const SizedBox(
                    height: USizes.spaceBtwSections,
                  ),

                  /// Description
                  const USectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: USizes.spaceBtwItems,
                  ),
                  const ReadMoreText(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  /// Reviews
                  const Divider(),
                  const SizedBox(
                    height: USizes.spaceBtwItems,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const USectionHeading(title: 'Reviews (199)',showActionButton: false,),
                      IconButton(onPressed: () => Get.to(()=> const ProductReviewsScreen()), icon: const Icon(Iconsax.arrow_right_3))
                    ],
                  ),
                  const SizedBox(
                    height: USizes.spaceBtwSections,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
