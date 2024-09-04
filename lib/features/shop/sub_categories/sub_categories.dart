import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopwithusama/common/widgets/appbar/appbar.dart';
import 'package:shopwithusama/common/widgets/images/u_rounded_image.dart';
import 'package:shopwithusama/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:shopwithusama/common/widgets/shimmer/horizontal_product_shimmer.dart';
import 'package:shopwithusama/common/widgets/text/section_heading.dart';
import 'package:shopwithusama/features/shop/controllers/category_controller.dart';
import 'package:shopwithusama/features/shop/models/category_model.dart';
import 'package:shopwithusama/features/shop/screens/all_products/all_products.dart';
import 'package:shopwithusama/utils/constants/image_strings.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';

import '../../../utils/helpers/cloud_helper_function.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: UAppBar(
        title: Text(category.name),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(USizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const URoundedImage(
                imageUrl: UImages.banner1,
                applyImageRadius: true,
                width: double.infinity,
              ),
              const SizedBox(
                height: USizes.spaceBtwSections,
              ),

              /// Sub-Categories
              FutureBuilder(
                  future: controller.getSubCategories(category.id),
                  builder: (context, snapshot) {
                    /// Handle Loader, No Record, OR Error Message
                    const loader = UHorizontalProductShimmer();
                    final widget = UCloudHelperFunction.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    /// Record Found
                    final subCategories = snapshot.data!;

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: subCategories.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        final subCategory = subCategories[index];

                        return FutureBuilder(
                            future: controller.getCategoryProducts(categoryId: subCategory.id),
                            builder: (context, snapshot) {

                              /// Handle Loader, No Record, OR Error Message
                              final widget = UCloudHelperFunction.checkMultiRecordState(
                                  snapshot: snapshot, loader: loader);
                              if (widget != null) return widget;

                              /// Record Found
                              final products = snapshot.data!;

                              return Column(
                                children: [
                                  USectionHeading(
                                    title: subCategory.name,
                                    onPressed: () => Get.to(
                                            () => AllProductsScreen(title: subCategory.name,futureMethod: controller.getCategoryProducts(categoryId: subCategory.id,limit: -1))
                                    ),
                                  ),
                                  const SizedBox(
                                    height: USizes.spaceBtwItems / 2,
                                  ),
                                  SizedBox(
                                    height: 120,
                                    child: ListView.separated(
                                      itemCount: products.length,
                                      scrollDirection: Axis.horizontal,
                                      separatorBuilder: (context, index) =>
                                      const SizedBox(
                                        width: USizes.spaceBtwItems,
                                      ),
                                      itemBuilder: (context, index) => UProductCardHorizontal(product: products[index]),
                                    ),
                                  ),
                                  const SizedBox(height: USizes.spaceBtwSections,)
                                ],
                              );
                            },
                        );
                      },
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
