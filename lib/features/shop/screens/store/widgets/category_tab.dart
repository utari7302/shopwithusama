import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopwithusama/common/widgets/layouts/grid_layout.dart';
import 'package:shopwithusama/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:shopwithusama/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:shopwithusama/common/widgets/text/section_heading.dart';
import 'package:shopwithusama/features/shop/controllers/category_controller.dart';
import 'package:shopwithusama/features/shop/models/category_model.dart';
import 'package:shopwithusama/features/shop/models/product.dart';
import 'package:shopwithusama/features/shop/screens/all_products/all_products.dart';
import 'package:shopwithusama/features/shop/screens/store/widgets/category_brands.dart';
import 'package:shopwithusama/utils/helpers/cloud_helper_function.dart';

import '../../../../../utils/constants/sizes.dart';

class UCategoryTab extends StatelessWidget {
  const UCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(USizes.defaultSpace),
          child: Column(
            children: [
              /// Brands
              CategoryBrands(category: category),
              const SizedBox(
                height: USizes.spaceBtwItems,
              ),

              /// Products
              FutureBuilder(
                  future: controller.getCategoryProducts(categoryId: category.id),
                  builder: (context, snapshot) {

                    final response = UCloudHelperFunction.checkMultiRecordState(snapshot: snapshot,loader: const UVerticalProductShimmer());
                    if(response != null) return response;

                    final products = snapshot.data!;

                    return Column(
                      children: [
                        USectionHeading(
                          title: 'You might like',
                          onPressed: () => Get.to(AllProductsScreen(title: category.name,futureMethod: controller.getCategoryProducts(categoryId: category.id,limit: -1))),
                        ),
                        const SizedBox(
                          height: USizes.spaceBtwItems,
                        ),
                        UGridLayout(
                          itemCount: products.length,
                          itemBuilder: (_, index) {
                            return UProductCardVertical(
                              product: products[index],
                            );
                          },
                        ),

                      ],
                    );
                  },
              )

            ],
          ),
        )
      ],
    );
  }
}
