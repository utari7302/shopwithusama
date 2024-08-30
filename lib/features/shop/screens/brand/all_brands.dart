import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopwithusama/common/widgets/appbar/appbar.dart';
import 'package:shopwithusama/common/widgets/brands/brand_card.dart';
import 'package:shopwithusama/common/widgets/layouts/grid_layout.dart';
import 'package:shopwithusama/common/widgets/text/section_heading.dart';
import 'package:shopwithusama/features/shop/controllers/brand_controller.dart';
import 'package:shopwithusama/features/shop/screens/brand/brand_products.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';

import '../../../../common/widgets/shimmer/brand_shimmer.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
      appBar: const UAppBar(
        title: Text('Brand'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(USizes.defaultSpace),
          child: Column(
            children: [
              const USectionHeading(
                title: 'Brands',
                showActionButton: false,
              ),
              Obx(
                () {
                  if (brandController.isLoading.value) {
                    return const UBrandShimmer();
                  }

                  if (brandController.allBrands.isEmpty) {
                    return Center(
                        child: Text('No Data Found!',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .apply(color: Colors.white)));
                  }
                  return UGridLayout(
                    itemCount: brandController.allBrands.length,
                    mainAxisExtent: 80,
                    itemBuilder: (_, index) {
                      final brand = brandController.allBrands[index];
                      return UBrandCard(
                        showBorder: true,
                        brand: brand,
                        onTap: () => Get.to(()=> BrandProducts(brand: brand)),
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
