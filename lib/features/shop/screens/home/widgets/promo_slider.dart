import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopwithusama/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:shopwithusama/common/widgets/images/u_rounded_image.dart';
import 'package:shopwithusama/features/shop/controllers/home_controller.dart';
import 'package:shopwithusama/utils/constants/colors.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';

class UPromoSlider extends StatelessWidget {
  const UPromoSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
          items: banners.map((url) => URoundedImage(imageUrl: url)).toList(),
        ),
        const SizedBox(
          height: USizes.spaceBtwItems,
        ),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < banners.length; i++)
                UCircularContainer(
                  width: 20,
                  height: 4,
                  margin: const EdgeInsets.only(right: 10),
                  backgroundColor: controller.carousalCurrentIndex.value == i
                      ? UColors.primary
                      : UColors.grey,
                )
            ],
          ),
        )
      ],
    );
  }
}
