import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopwithusama/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:shopwithusama/utils/constants/colors.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/device/device_utility.dart';
import 'package:shopwithusama/utils/helpers/helper_functions.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: UDeviceUtility.getBottomNavigationBarHeight() + 25,
      right: USizes.defaultSpace,
      child: ElevatedButton(
        onPressed: OnBoardingController.instance.nextPage,
        style: ElevatedButton.styleFrom(shape: const CircleBorder(),backgroundColor: dark ? UColors.primary : UColors.black),
        child: const Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}