import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopwithusama/common/widgets/appbar/appbar.dart';
import 'package:shopwithusama/common/widgets/brands/brand_card.dart';
import 'package:shopwithusama/common/widgets/layouts/grid_layout.dart';
import 'package:shopwithusama/common/widgets/text/section_heading.dart';
import 'package:shopwithusama/features/shop/screens/brand/brand_products.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

              /// Products
              UGridLayout(
                itemCount: 10,
                mainAxisExtent: 80,
                itemBuilder: (_, __) => UBrandCard(
                  showBorder: true,
                  onTap: () => Get.to(() => const BrandProducts()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
