import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopwithusama/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:shopwithusama/common/widgets/images/u_rounded_image.dart';
import 'package:shopwithusama/features/shop/controllers/banner_controller.dart';
import 'package:shopwithusama/utils/constants/colors.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';

import '../../../../../common/widgets/shimmer/shimmer.dart';

class UPromoSlider extends StatelessWidget {
  const UPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(
      () {
        // Loader
        if (controller.isLoading.value)
          return const UShimmerEffect(width: double.infinity, height: 190);

        // No data found
        if (controller.banners.isEmpty) {
          return const Center(child: Text('No Data Found!'));
        } else {
          return Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1,
                  onPageChanged: (index, _) =>
                      controller.updatePageIndicator(index),
                ),
                items: controller.banners
                    .map((banner) => URoundedImage(
                          imageUrl: banner.imageUrl,
                          isNetworkImage: true,
                          onPressed: () => Get.toNamed(banner.targetScreen),
                        ))
                    .toList(),
              ),
              const SizedBox(
                height: USizes.spaceBtwItems,
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < controller.banners.length; i++)
                      UCircularContainer(
                        width: 20,
                        height: 4,
                        margin: const EdgeInsets.only(right: 10),
                        backgroundColor:
                            controller.carousalCurrentIndex.value == i
                                ? UColors.primary
                                : UColors.grey,
                      )
                  ],
                ),
              )
            ],
          );
        }
      },
    );
  }
}
