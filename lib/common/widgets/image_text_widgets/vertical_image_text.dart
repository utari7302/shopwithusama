import 'package:flutter/material.dart';
import 'package:shopwithusama/common/widgets/images/u_circular_image.dart';
import 'package:shopwithusama/utils/constants/colors.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/helpers/helper_functions.dart';

class UVerticalImageText extends StatelessWidget {
  const UVerticalImageText({
    super.key, required this.image, required this.title, this.textColor = UColors.white, this.backgroundColor, this.onTap, this.isNetworkImage = true,
  });

  final String image,title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: USizes.spaceBtwItems),
        child: Column(
          children: [

            UCircularImage(
                image: image,
              fit: BoxFit.fitWidth,
              padding: USizes.sm*1.4,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: dark ? UColors.light : UColors.dark,
            ),
            // Container(
            //   width: 56,
            //   height: 56,
            //   padding: const EdgeInsets.all(USizes.sm),
            //   decoration: BoxDecoration(
            //       color: backgroundColor ?? (dark ? UColors.black : UColors.white),
            //       borderRadius:
            //       BorderRadius.circular(100)),
            //   child: Center(
            //     child: Image(
            //       image: AssetImage(image),
            //       fit: BoxFit.cover,
            //       color: dark ? UColors.light : UColors.dark,
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: USizes.spaceBtwItems / 2,
            ),
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}