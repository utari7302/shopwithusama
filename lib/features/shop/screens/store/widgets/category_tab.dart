import 'package:flutter/material.dart';
import 'package:shopwithusama/common/widgets/brands/brand_show_case.dart';
import 'package:shopwithusama/common/widgets/layouts/grid_layout.dart';
import 'package:shopwithusama/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:shopwithusama/common/widgets/text/section_heading.dart';
import 'package:shopwithusama/features/shop/models/category_model.dart';
import 'package:shopwithusama/features/shop/models/product.dart';
import 'package:shopwithusama/utils/constants/image_strings.dart';

import '../../../../../utils/constants/sizes.dart';

class UCategoryTab extends StatelessWidget {
  const UCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [Padding(
        padding: const EdgeInsets.all(USizes.defaultSpace),
        child: Column(
          children: [
            /// Brands
            const UBrandShowCase(
              images: [
                UImages.productImage5,
                UImages.productImage4,
                UImages.productImage3,
              ],
            ),
            const SizedBox(height: USizes.spaceBtwItems,),
            /// Products
            USectionHeading(title: 'You might like',onPressed: () {

            },),
            const SizedBox(height: USizes.spaceBtwItems,),
            UGridLayout(itemCount: 2, itemBuilder: (_, index) {
              return UProductCardVertical(product: ProductModel.empty(),);
            },),
            const SizedBox(height: USizes.spaceBtwItems,),
          ],
        ),
      )],
    );
  }
}
