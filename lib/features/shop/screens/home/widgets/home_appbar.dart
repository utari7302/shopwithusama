import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopwithusama/common/widgets/appbar/appbar.dart';
import 'package:shopwithusama/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:shopwithusama/features/personalization/controllers/user_controller.dart';
import 'package:shopwithusama/utils/constants/colors.dart';
import 'package:shopwithusama/utils/constants/text_strings.dart';

import '../../../../../common/widgets/shimmer/shimmer.dart';


class UHomeAppBar extends StatelessWidget {
  const UHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return UAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            UTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: UColors.grey),
          ),
          Obx(
            () {
              if(controller.profileLoading.value){
                // Display a shimmer loader while user profile is being loaded
                return const UShimmerEffect(width: 80, height: 15);
              }else{
                return Text(
                  controller.user.value.fullName,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: UColors.white),
                );
              }

            },
          ),
        ],
      ),
      actions: const [
        UCartCounterIcon(
          iconColor: UColors.white,
        )
      ],
    );
  }
}
