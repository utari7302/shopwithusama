import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopwithusama/common/widgets/layouts/grid_layout.dart';
import 'package:shopwithusama/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:shopwithusama/features/shop/controllers/all_products_controller.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';

import '../../../../features/shop/models/product.dart';

class USortableProducts extends StatelessWidget {
  const USortableProducts({
    super.key, required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);
    return Column(
      children: [
        /// Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          value: controller.selectedSortOption.value,
          onChanged: (value) {
            // Sort product based on the selected option
            controller.sortProducts(value!);
          },
          items: ['Name','Higher Price','Lower Price','Sale','Newest','Popularity'].map((option) => DropdownMenuItem(value: option,child: Text(option))).toList(),
        ),
        const SizedBox(height: USizes.spaceBtwItems,),

        /// Products
        Obx(() => UGridLayout(itemCount: controller.products.length, itemBuilder: (_, index) => UProductCardVertical(product: controller.products[index])),)
      ],
    );
  }
}