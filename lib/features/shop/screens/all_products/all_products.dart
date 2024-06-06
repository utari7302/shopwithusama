import 'package:flutter/material.dart';
import 'package:shopwithusama/common/widgets/appbar/appbar.dart';
import 'package:shopwithusama/common/widgets/products/sortable/sortable_products.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: UAppBar(
        title: Text('Popular Products'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(USizes.defaultSpace),
          child: USortableProducts(),
        ),
      ),
    );
  }
}


