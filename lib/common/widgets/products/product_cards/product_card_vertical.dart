import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopwithusama/common/styles/shadows.dart';
import 'package:shopwithusama/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shopwithusama/common/widgets/icons/u_circular_icon.dart';
import 'package:shopwithusama/common/widgets/images/u_rounded_image.dart';
import 'package:shopwithusama/common/widgets/products/product_cards/product_price_text.dart';
import 'package:shopwithusama/common/widgets/text/product_title_text.dart';
import 'package:shopwithusama/common/widgets/text/u_brand_title_text_with_verification_icon.dart';
import 'package:shopwithusama/features/shop/controllers/product_controller.dart';
import 'package:shopwithusama/features/shop/models/product.dart';
import 'package:shopwithusama/features/shop/screens/product_details/product_details.dart';
import 'package:shopwithusama/utils/constants/colors.dart';
import 'package:shopwithusama/utils/constants/enums.dart';
import 'package:shopwithusama/utils/constants/image_strings.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/helpers/helper_functions.dart';

class UProductCardVertical extends StatelessWidget {
  const UProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = UHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(()=> ProductDetailsScreen(product: product)),
      child: Container(
        width: 180,
        decoration: BoxDecoration(
            boxShadow: [UShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(USizes.productImageRadius),
            color: dark ? UColors.darkerGrey : UColors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Thumbnail, Wishlist button, Discount Tag
            URoundedContainer(
              width: double.infinity,
              height: 180,
              padding: const EdgeInsets.all(USizes.sm),
              backgroundColor: dark ? UColors.dark : UColors.light,
              child: Stack(
                children: [
                  /// Thumbnail Image
                  Center(
                    child: URoundedImage(
                      imageUrl: product.thumbnail,
                      applyImageRadius: true,
                      isNetworkImage: true,
                    ),
                  ),

                  /// Size Tag
                  Positioned(
                    top: 12,
                    child: URoundedContainer(
                      radius: USizes.sm,
                      backgroundColor: UColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: USizes.sm, vertical: USizes.xs),
                      child: Text(
                        '$salePercentage%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: UColors.black),
                      ),
                    ),
                  ),

                  const Positioned(
                      top: 0,
                      right: 0,
                      child: UCircularIcon(
                        icon: Iconsax.heart5,
                        color: Colors.red,
                      ),
                  )
                ],
              ),
            ),

            const SizedBox(height: USizes.spaceBtwItems / 2,),
            /// Details
            Padding(
                padding: const EdgeInsets.only(left: USizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UProductTitleText(title: product.title,smallSize: true,),
                  const SizedBox(height: USizes.spaceBtwItems / 4,),
                  UBrandTitleWithVerification(title: product.brand!.name,),

                ],
              ),
            ),
            const Spacer(),

            /// Price Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    children: [


                      /// Price, Show sale price as main price if sale exist
                      Padding(
                        padding: const EdgeInsets.only(left: USizes.sm),
                        child: Row(
                          children: [
                            UProductPriceText(price: controller.getProductPrice(product), isLarge: true,),
                            const SizedBox(width: 10,),
                            if(product.productType == ProductType.single.toString() && product.salePrice > 0)
                              Padding(
                                padding: const EdgeInsets.only(left: USizes.sm),
                                child: Text(
                                  product.price.toString(),
                                  style: Theme.of(context).textTheme.headlineSmall!.apply(decoration: TextDecoration.lineThrough),
                                )
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                /// Add to cart button
                Container(
                  decoration: const BoxDecoration(
                      color: UColors.dark,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(USizes.cardRadiusMd),
                        bottomRight: Radius.circular(USizes.productImageRadius),
                      )
                  ),
                  child: const SizedBox(
                    width: USizes.iconLg * 1.2,
                    height: USizes.iconLg * 1.2,
                    child: Center(child: Icon(Iconsax.add, color: UColors.white,)),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}






