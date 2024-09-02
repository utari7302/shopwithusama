import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopwithusama/common/widgets/brands/brand_card.dart';
import 'package:shopwithusama/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shopwithusama/common/widgets/shimmer/shimmer.dart';
import 'package:shopwithusama/features/shop/screens/brand/brand_products.dart';
import 'package:shopwithusama/utils/constants/colors.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/helpers/helper_functions.dart';

import '../../../features/shop/models/brand_model.dart';

class UBrandShowCase extends StatelessWidget {
  const UBrandShowCase({
    super.key,
    required this.images, required this.brand,
  });

  final BrandModel brand;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(()=>BrandProducts(brand: brand)),
      child: URoundedContainer(
        showBorder: true,
        borderColor: UColors.darkGrey,
        backgroundColor: Colors.transparent,
        margin: const EdgeInsets.only(bottom: USizes.spaceBtwItems),
        padding: const EdgeInsets.all(USizes.md),
        child: Column(
          children: [
            /// Brand with product count
             UBrandCard(
              showBorder: false,
              brand: brand,
            ),

            /// Brand top 3 product images
            Row(
              children: images.map((image) => brandTopProductImageWidth(image, context)).toList(),
            )
          ],
        ),
      ),
    );
  }

  Widget brandTopProductImageWidth(String image, context) {
    return Expanded(
        child: URoundedContainer(
          height: 100,
          backgroundColor: UHelperFunctions.isDarkMode(context) ? UColors.darkerGrey : UColors.light,
          margin: const EdgeInsets.only(right: USizes.sm),
          padding: const EdgeInsets.all(USizes.md),
          child: CachedNetworkImage(
            fit: BoxFit.contain,
            imageUrl: image,
            progressIndicatorBuilder: (context, url, progress) => const UShimmerEffect(width: 100, height: 100),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          )
        ));
  }
}
