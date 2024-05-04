import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopwithusama/utils/constants/colors.dart';

class URatingBarIndicatior extends StatelessWidget {
  const URatingBarIndicatior({
    super.key, required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemSize: 20,
      unratedColor: UColors.grey,
      itemBuilder:(_, __) => const Icon(Iconsax.star1,color: UColors.primary,),
    );
  }
}