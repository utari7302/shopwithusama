import 'package:flutter/material.dart';
import 'package:shopwithusama/common/widgets/shimmer/shimmer.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';

class UListTileShimmer extends StatelessWidget {
  const UListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            UShimmerEffect(width: 50, height: 50,radius: 50),
            SizedBox(width: USizes.spaceBtwItems),
            Column(
              children: [
                UShimmerEffect(width: 100, height: 15),
                SizedBox(height: USizes.spaceBtwItems/2),
                UShimmerEffect(width: 80, height: 12)
              ],
            )
          ],
        )
      ],
    );
  }
}
