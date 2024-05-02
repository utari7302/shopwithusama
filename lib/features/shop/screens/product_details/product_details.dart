import 'package:flutter/material.dart';
import 'package:shopwithusama/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:shopwithusama/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:shopwithusama/features/shop/screens/product_details/widgets/rating_share.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/helpers/helper_functions.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            UProductImageSlider(),
            Padding(
              padding: EdgeInsets.only(
                right: USizes.defaultSpace,
                left: USizes.defaultSpace,
                bottom: USizes.defaultSpace,
              ),
              child: Column(
                children: [
                  /// Rating
                  URatingAndShare(),
                  /// Price, Title, Stock & Brand
                  UProductMetaData()
                  /// Attributes
                  /// Checkout Button
                  /// Description
                  /// Reviews
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


