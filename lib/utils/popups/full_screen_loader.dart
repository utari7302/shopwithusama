import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopwithusama/common/widgets/loaders/animation_loader.dart';
import 'package:shopwithusama/utils/constants/colors.dart';
import 'package:shopwithusama/utils/helpers/helper_functions.dart';

class UFullScreenLoader {
  // Open a full-screen loading dialog with a given text and animation
  // This method didn't return anything

  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      // Use Get.overlayContext for overlay dialogs
      barrierDismissible: false,
      // The dialog can't be dismissed by tapping outside it
      builder: (_) => PopScope(
        canPop: false, // Disable popping with the back button
        child: Container(
          color: UHelperFunctions.isDarkMode(Get.context!)
              ? UColors.dark
              : UColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 250,
              ),
              // Adjust the spacing as needed
              UAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
  }
}
