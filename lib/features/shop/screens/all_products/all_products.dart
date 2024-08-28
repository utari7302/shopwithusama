import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopwithusama/common/widgets/appbar/appbar.dart';
import 'package:shopwithusama/common/widgets/products/sortable/sortable_products.dart';
import 'package:shopwithusama/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:shopwithusama/features/shop/models/product.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/helpers/cloud_helper_function.dart';

import '../../controllers/all_products_controller.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen(
      {super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    return Scaffold(
      appBar: UAppBar(
        title: Text(title),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(USizes.defaultSpace),
            child: FutureBuilder(
              future: futureMethod ?? controller.fetchProductsByQuery(query),
              builder: (context, snapshot) {
                // Check the state of the FutureBuilder snapshot
                const loader = UVerticalProductShimmer();
                final widget = UCloudHelperFunction.checkMultiRecordState(snapshot: snapshot,loader: loader);
                if(widget != null) return widget;
                // Products found!
                final products = snapshot.data!;

                return USortableProducts(products: products);
              },
            )),
      ),
    );
  }
}
