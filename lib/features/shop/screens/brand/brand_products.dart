import 'package:flutter/material.dart';
import 'package:shopwithusama/common/widgets/appbar/appbar.dart';
import 'package:shopwithusama/common/widgets/brands/brand_card.dart';
import 'package:shopwithusama/common/widgets/products/sortable/sortable_products.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: UAppBar(
        title: Text('Nike'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(USizes.defaultSpace),
          child: Column(
            children: [
              UBrandCard(showBorder: true),
              SizedBox(height: USizes.spaceBtwItems,),
              USortableProducts(products: [],)
            ],
          ),
        ),
      ),
    );
  }
}
