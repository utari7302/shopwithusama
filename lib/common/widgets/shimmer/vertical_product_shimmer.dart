import 'package:flutter/material.dart';
import 'package:shopwithusama/common/widgets/layouts/grid_layout.dart';
import 'package:shopwithusama/common/widgets/shimmer/shimmer.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';

class UVerticalProductShimmer extends StatelessWidget {
  const UVerticalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return UGridLayout(itemCount: itemCount, itemBuilder: (_, __) => const SizedBox(
      width: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Image
          UShimmerEffect(width: 180, height: 180),
          SizedBox(height: USizes.spaceBtwItems,),

          /// Text
          UShimmerEffect(width: 160, height: 15),
          SizedBox(height: USizes.spaceBtwItems / 2,),
          UShimmerEffect(width: 110, height: 15)
        ],
      ),
    ),);
  }
}
