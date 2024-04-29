import 'package:flutter/material.dart';
import 'package:shopwithusama/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: USizes.appBarHeight,
      right: USizes.defaultSpace,
      child: TextButton(onPressed: OnBoardingController.instance.skipPage, child: const Text("Skip")),
    );
  }
}