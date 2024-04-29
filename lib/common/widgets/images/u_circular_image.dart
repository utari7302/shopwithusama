import 'package:flutter/material.dart';
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
      child: Image(
        fit: fit,
        image: isNetworkImage ? NetworkImage(image) : const AssetImage(UImages.clothIcon) as ImageProvider,
        color: overlayColor,
      ),
    );
  }
}
