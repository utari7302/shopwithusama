import 'package:flutter/material.dart';
import 'package:shopwithusama/common/widgets/images/u_circular_image.dart';
import 'package:shopwithusama/common/widgets/products/product_cards/product_price_text.dart';
import 'package:shopwithusama/common/widgets/text/product_title_text.dart';
import 'package:shopwithusama/common/widgets/text/u_brand_title_text_with_verification_icon.dart';
import 'package:shopwithusama/features/shop/models/product.dart';
import 'package:shopwithusama/utils/constants/colors.dart';
import 'package:shopwithusama/utils/constants/enums.dart';
import 'package:shopwithusama/utils/constants/image_strings.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../controllers/product/product_controller.dart';

class UProductMetaData extends StatelessWidget {
  const UProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sale Price
        Row(
            children: [
              /// Sale Tag
              URoundedContainer(
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
              const SizedBox(width: USizes.spaceBtwItems,),

              /// Price
              if(product.productType == ProductType.single.toString() && product.salePrice > 0)
                Text('\$${product.price}',style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
              if(product.productType == ProductType.single.toString() && product.salePrice > 0) const SizedBox(width: USizes.spaceBtwItems,),
              UProductPriceText(price: controller.getProductPrice(product),isLarge: true,)
            ],
        ),
        const SizedBox(height: USizes.spaceBtwItems / 1.5,),
        /// Title
        UProductTitleText(title: product.title),
        const SizedBox(height: USizes.spaceBtwItems / 1.5,),
        /// Stock Status
        Row(
          children: [
            const UProductTitleText(title: 'Status:',smallSize: true,),
            const SizedBox(width: USizes.spaceBtwItems,),
            Text(controller.getProductStockStatus(product.stock),style: Theme.of(context).textTheme.titleMedium,)
          ],
        ),
        const SizedBox(height: USizes.spaceBtwItems / 1.5,),
        /// Brand
        Row(
          children: [
            UCircularImage(image: product.brand != null ? product.brand!.image : '',width: 32,height: 32,overlayColor: dark ? UColors.white : UColors.black,isNetworkImage: true,),
            Expanded(child: UBrandTitleWithVerification(title: product.brand != null ? product.brand!.name : '', brandTextSize: TextSizes.medium))
          ],
        )

      ],
    );
  }
}
