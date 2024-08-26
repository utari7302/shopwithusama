import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopwithusama/common/widgets/layouts/grid_layout.dart';
import 'package:shopwithusama/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';

import '../../../../features/shop/models/product.dart';

class USortableProducts extends StatelessWidget {
  const USortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {},
          items: ['Name','Higher Price','Lower Price','Sale','Newest','Popularity'].map((option) => DropdownMenuItem(value: option,child: Text(option))).toList(),
        ),
        const SizedBox(height: USizes.spaceBtwItems,),

        /// Products
        UGridLayout(itemCount: 8, itemBuilder: (_, __) => UProductCardVertical(product: ProductModel.empty(),),)
      ],
    );
  }
}