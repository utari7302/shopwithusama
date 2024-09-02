import 'package:flutter/material.dart';
import 'package:shopwithusama/features/shop/controllers/brand_controller.dart';
import 'package:shopwithusama/features/shop/models/category_model.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/helpers/cloud_helper_function.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../common/widgets/shimmer/list_tile_shimmer.dart';
import '../../../../../utils/constants/image_strings.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
        future: controller.getBrandsForCategory(category.id),
        builder: (context, snapshot) {

          /// Handle Loader, No Record, OR Error Message
          const loader = Column(
            children: [
              UListTileShimmer(),
              SizedBox(height: USizes.spaceBtwItems),
              UListTileShimmer(),
              SizedBox(height: USizes.spaceBtwItems),
            ],
          );
          final widget = UCloudHelperFunction.checkMultiRecordState(snapshot: snapshot,loader: loader);
          if(widget != null) return widget;

          final brands = snapshot.data!;

          return ListView.builder(
            shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: brands.length,
              itemBuilder: (_, index) {
                final brand = brands[index];
                return FutureBuilder(
                  future: controller.getBrandProducts(brandId: brand.id, limit: 3),
                  builder: (context, snapshot) {

                    final widget = UCloudHelperFunction.checkMultiRecordState(snapshot: snapshot,loader: loader);
                    if(widget != null) return widget;

                    final products = snapshot.data!;

                    return UBrandShowCase(
                      brand: brand,
                      images: products.map((e) => e.thumbnail).toList(),
                    );
                  }
                );
              },
          );
        },
    );
  }
}
