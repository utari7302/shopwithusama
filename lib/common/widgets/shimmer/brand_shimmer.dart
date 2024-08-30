import 'package:flutter/material.dart';
import 'package:shopwithusama/common/widgets/layouts/grid_layout.dart';
import 'package:shopwithusama/common/widgets/shimmer/shimmer.dart';

class UBrandShimmer extends StatelessWidget {
  const UBrandShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return UGridLayout(
      mainAxisExtent: 80,
        itemCount: itemCount, itemBuilder: (_, __) => const UShimmerEffect(width: 300, height: 80));
  }
}
