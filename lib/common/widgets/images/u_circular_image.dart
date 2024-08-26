import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopwithusama/common/widgets/shimmer/shimmer.dart';
import 'package:shopwithusama/utils/constants/colors.dart';
import 'package:shopwithusama/utils/constants/image_strings.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/helpers/helper_functions.dart';

class UCircularImage extends StatelessWidget {
  const UCircularImage(
      {super.key,
      this.width = 56,
      this.height = 56,
      this.padding = USizes.sm,
      this.backgroundColor,
      this.overlayColor,
      this.isNetworkImage = false,
      required this.image,
      this.fit = BoxFit.cover});

  final double width, height, padding;
  final Color? backgroundColor;
  final Color? overlayColor;
  final bool isNetworkImage;
  final String image;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ?? (dark ? UColors.black : UColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetworkImage ?
          CachedNetworkImage(
            fit: fit,
            color: overlayColor,
            imageUrl: image,
            progressIndicatorBuilder: (context, url, progress) => const UShimmerEffect(width: 55,height: 55,radius: 55,),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ) : Image(
            fit: fit,
            image: AssetImage(image),
            color: overlayColor,
          ),
        ),
      ),
    );
  }
}
