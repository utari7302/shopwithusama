import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopwithusama/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:shopwithusama/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:shopwithusama/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:shopwithusama/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:shopwithusama/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:shopwithusama/utils/constants/image_strings.dart';
import 'package:shopwithusama/utils/constants/text_strings.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: UImages.onBoardingImage1,
                title: UTexts.onBoardingTitle1,
                subTitle: UTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: UImages.onBoardingImage2,
                title: UTexts.onBoardingTitle2,
                subTitle: UTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: UImages.onBoardingImage3,
                title: UTexts.onBoardingTitle3,
                subTitle: UTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          /// Skip Button
          const OnBoardingSkip(),

          /// Dot Navigation Smooth Page Indicator
          const OnBoardingDotNavigation(),

          /// Circular Button
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}
