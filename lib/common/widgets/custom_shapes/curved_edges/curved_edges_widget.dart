
import 'package:flutter/material.dart';
import 'package:shopwithusama/common/widgets/custom_shapes/curved_edges/curved_edges.dart';

class UCurvedEdgeWidget extends StatelessWidget {
  const UCurvedEdgeWidget({
    super.key, this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
        clipper: UCustomCurvedEdges(),
        child: child
    );
  }
}