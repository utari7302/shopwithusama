import 'package:flutter/material.dart';
import 'package:shopwithusama/common/widgets/shimmer/shimmer.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';

class UCategoryShimmer extends StatelessWidget {
  const UCategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        separatorBuilder: (_, __) => const SizedBox(width: USizes.spaceBtwItems,),
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UShimmerEffect(width: 55, height: 55,radius: 55,),
              SizedBox(height: USizes.spaceBtwItems / 2,),

              UShimmerEffect(width: 55, height: 8)
            ],
          );
        },
      ),
    );
  }
}
