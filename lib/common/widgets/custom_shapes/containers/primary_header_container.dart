import 'package:flutter/material.dart';
import 'package:shopwithusama/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:shopwithusama/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:shopwithusama/utils/constants/colors.dart';

class UPrimaryHeaderContainer extends StatelessWidget {
  const UPrimaryHeaderContainer({
    super.key, required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return UCurvedEdgeWidget(child: Container(
      color: UColors.primary,
      padding: const EdgeInsets.all(0),
      child: SizedBox(
        height: 400,
        child: Stack(
          children: [
            Positioned(top: -150,right: -250,child: UCircularContainer(backgroundColor: UColors.textWhite.withOpacity(0.1),)),
            Positioned(top: 100,right: -300,child: UCircularContainer(backgroundColor: UColors.textWhite.withOpacity(0.1),)),
            child
          ],
        ),
      ),
    ),);
  }
}