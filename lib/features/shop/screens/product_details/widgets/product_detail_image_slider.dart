import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopwithusama/common/widgets/appbar/appbar.dart';
import 'package:shopwithusama/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:shopwithusama/common/widgets/icons/u_circular_icon.dart';
import 'package:shopwithusama/common/widgets/images/u_rounded_image.dart';
import 'package:shopwithusama/utils/constants/colors.dart';
import 'package:shopwithusama/utils/constants/image_strings.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/helpers/helper_functions.dart';

import '../../../controllers/product/image_controller.dart';
import '../../../models/product.dart';

class UProductImageSlider extends StatelessWidget {
  const UProductImageSlider({
    super.key, required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);

    final controller = Get.put(ImageController());
    final images = controller.getAllProductImages(product);

    return UCurvedEdgeWidget(
      child: Container(
        color: dark ? UColors.darkerGrey : UColors.light,
        child: Stack(
          children: [

            /// Main Large Image
             SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(USizes.productImageRadius * 2),
                child: Center(
                    child: Obx(() {
                      final image = controller.selectedProductImage.value;
                      return GestureDetector(
                        onTap: ()=> controller.showEnlargedImage(image),
                        child: CachedNetworkImage(
                            imageUrl: image,
                          progressIndicatorBuilder: (_,__,downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress,color: UColors.primary),
                        ),
                      );
                    },)
                ),
              ),
            ),

            /// Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: USizes.defaultSpace,
              child: Center(
                child: SizedBox(
                  height: 80,
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    separatorBuilder: (_, __) => const SizedBox(width: USizes.spaceBtwItems,),
                    itemBuilder: (_, index) => Obx(() {
                      final imageSelected = controller.selectedProductImage.value == images[index];
                      return URoundedImage(
                        width: 80,
                        isNetworkImage: true,
                        backgroundColor: dark ? UColors.dark : UColors.light ,
                        imageUrl: images[index],
                        padding: const EdgeInsets.all(USizes.sm),
                        onPressed: () => controller.selectedProductImage.value = images[index],
                        border: Border.all(color: imageSelected ? UColors.primary : Colors.transparent),
                      );
                    },)

                  ),
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
