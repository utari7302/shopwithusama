import 'package:flutter/material.dart';
import 'package:shopwithusama/common/widgets/shimmer/shimmer.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';

class UBoxesShimmer extends StatelessWidget {
  const UBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: UShimmerEffect(width: 150,height: 110)),
            SizedBox(width: USizes.spaceBtwItems),
            Expanded(child: UShimmerEffect(width: 150,height: 110)),
            SizedBox(width: USizes.spaceBtwItems),
            Expanded(child: UShimmerEffect(width: 150,height: 110)),
          ],
        )
      ],
    );
  }
}
