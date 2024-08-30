import 'package:flutter/material.dart';
import 'package:shopwithusama/common/widgets/appbar/appbar.dart';
import 'package:shopwithusama/common/widgets/brands/brand_card.dart';
import 'package:shopwithusama/common/widgets/products/sortable/sortable_products.dart';
import 'package:shopwithusama/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:shopwithusama/features/shop/controllers/brand_controller.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/helpers/cloud_helper_function.dart';

import '../../models/brand_model.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: UAppBar(
        title: Text(brand.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(USizes.defaultSpace),
          child: Column(
            children: [
              UBrandCard(showBorder: true,brand: brand),
              const SizedBox(height: USizes.spaceBtwItems,),
              
              FutureBuilder(
                  future: controller.getBrandProducts(brand.id),
                  builder: (context, snapshot) {
                    /// Handle Loader, No Record, OR Error Message
                    const loader = UVerticalProductShimmer();
                    final widget = UCloudHelperFunction.checkMultiRecordState(snapshot: snapshot,loader: loader);
                    if(widget!=null) return widget;

                    /// Record Found
                    final brandProducts = snapshot.data!;
                    return USortableProducts(products: brandProducts);
                  },
              )

            ],
          ),
        ),
      ),
    );
  }
}
