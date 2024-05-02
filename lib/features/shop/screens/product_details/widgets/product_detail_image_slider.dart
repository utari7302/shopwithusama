import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopwithusama/common/widgets/appbar/appbar.dart';
import 'package:shopwithusama/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:shopwithusama/common/widgets/icons/u_circular_icon.dart';
import 'package:shopwithusama/common/widgets/images/u_rounded_image.dart';
import 'package:shopwithusama/utils/constants/colors.dart';
import 'package:shopwithusama/utils/constants/image_strings.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/helpers/helper_functions.dart';

class UProductImageSlider extends StatelessWidget {
  const UProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return UCurvedEdgeWidget(
      child: Container(
        color: dark ? UColors.darkerGrey : UColors.light,
        child: Stack(
          children: [

            /// Main Large Image
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(USizes.productImageRadius * 2),
                child: Center(
                    child:
                    Image(image: AssetImage(UImages.productImage1))),
              ),
            ),

            /// Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: USizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  separatorBuilder: (_, __) => const SizedBox(width: USizes.spaceBtwItems,),
                  itemBuilder: (_, index) {
                    return URoundedImage(
                      width: 80,
                      backgroundColor: dark ? UColors.dark : UColors.light ,
                      imageUrl: UImages.productImage1,
                      padding: const EdgeInsets.all(USizes.sm),
                      border: Border.all(color: UColors.primary),
                    );
                  },

                ),
              ),
            ),

            /// AppbarIcons
            const UAppBar(
              showBackArrow: true,
              actions: [UCircularIcon(icon: Iconsax.heart5,color: Colors.red,)],
            )
          ],
        ),
      ),
    );
  }
}
