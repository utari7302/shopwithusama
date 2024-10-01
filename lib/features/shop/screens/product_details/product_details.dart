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
import 'package:shopwithusama/utils/constants/enums.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/helpers/helper_functions.dart';

import '../../models/product.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: UBottomAddToCart(product: product),
      body: SingleChildScrollView(
        child: Column(
          children: [
            UProductImageSlider(product: product),
            Padding(
              padding: const EdgeInsets.only(
                right: USizes.defaultSpace,
                left: USizes.defaultSpace,
                bottom: USizes.defaultSpace,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Rating
                  const URatingAndShare(),

                  /// Price, Title, Stock & Brand
                  UProductMetaData(product: product),

                  /// Attributes
                  if(product.productType == ProductType.variable.toString()) UProductAttribute(product: product),

                  if(product.productType == ProductType.variable.toString()) const SizedBox(height: USizes.spaceBtwSections,),

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
                  ReadMoreText(
                    product.description ?? '',
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
