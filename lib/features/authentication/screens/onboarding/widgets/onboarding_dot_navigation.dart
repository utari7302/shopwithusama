import 'package:flutter/material.dart';
import 'package:shopwithusama/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:shopwithusama/utils/constants/colors.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/device/device_utility.dart';
import 'package:shopwithusama/utils/helpers/helper_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    final controller = OnBoardingController.instance;

    return Positioned(
      bottom: UDeviceUtility.getBottomNavigationBarHeight() + 25,
      left: USizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        effect: ExpandingDotsEffect(
            activeDotColor: dark ? UColors.light : UColors.dark, dotHeight: 6),
      ),
    );
  }
}