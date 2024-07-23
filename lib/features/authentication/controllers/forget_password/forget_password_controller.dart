import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shopwithusama/data/repositories/authentication/authentication_repository.dart';
import 'package:shopwithusama/features/authentication/screens/password_configuration/reset_password.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/network/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController{
  static ForgetPasswordController get instance => Get.find();

  ///Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  ///Send Reset Password Email
  sendPasswordResetEmail() async {
    try{
      // Start Loading
      UFullScreenLoader.openLoadingDialog("Logging you in...", UImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        // Remove Loader
        UFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if(!forgetPasswordFormKey.currentState!.validate()){
        // Remove Loader
        UFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      // Remove Loader
      UFullScreenLoader.stopLoading();

      // Show Success Screen
      ULoaders.successSnackBar(title: 'Email Sent',message: 'Email Link Sent to Reset your Password'.tr);

      // Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));


    }catch(e){
      // Remove Loader
      UFullScreenLoader.stopLoading();
      // Show some Generic Error to the user
      ULoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
      return;
    }
  }

  resendPasswordResetEmail(String email) async {
    try{
      // Start Loading
      UFullScreenLoader.openLoadingDialog("Logging you in...", UImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        // Remove Loader
        UFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if(!forgetPasswordFormKey.currentState!.validate()){
        // Remove Loader
        UFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Remove Loader
      UFullScreenLoader.stopLoading();

      // Show Success Screen
      ULoaders.successSnackBar(title: 'Email Sent',message: 'Email Link Sent to Reset your Password'.tr);



    }catch(e){
      // Remove Loader
      UFullScreenLoader.stopLoading();
      // Show some Generic Error to the user
      ULoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
      return;
    }
  }

}