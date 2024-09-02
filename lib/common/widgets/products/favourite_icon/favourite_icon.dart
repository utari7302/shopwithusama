import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopwithusama/features/shop/controllers/product/favourite_controller.dart';

import '../../../../utils/constants/colors.dart';
import '../../icons/u_circular_icon.dart';

class UFavouriteIcon extends StatelessWidget {
  const UFavouriteIcon({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouriteController());
    return Obx( ()=> UCircularIcon(
        icon: controller.isFavourite(productId) ? Iconsax.heart5 : Iconsax.heart,
        color: controller.isFavourite(productId) ? UColors.error : null,
      onPressed: () => controller.toggleFavoriteProduct(productId),
      ),
    );
  }
}
