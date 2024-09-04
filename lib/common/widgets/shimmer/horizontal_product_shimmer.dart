import 'package:flutter/material.dart';
import 'package:shopwithusama/common/widgets/shimmer/shimmer.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';

class UHorizontalProductShimmer extends StatelessWidget {
  const UHorizontalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: USizes.spaceBtwItems),
      height: 120,
      child: ListView.separated(
        itemCount: itemCount,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => const SizedBox(width: USizes.spaceBtwItems),
        itemBuilder: (context, index) => const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Images
            UShimmerEffect(width: 120, height: 120),
            SizedBox(width: USizes.spaceBtwItems),

            // Text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: USizes.spaceBtwItems / 2),
                UShimmerEffect(width: 160, height: 15),
                SizedBox(width: USizes.spaceBtwItems / 2),
                UShimmerEffect(width: 110, height: 15),
                SizedBox(width: USizes.spaceBtwItems / 2),
                UShimmerEffect(width: 80, height: 15),

              ],
            )

          ],
        ),

      ),
    );
  }
}
