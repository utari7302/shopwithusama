import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shopwithusama/features/personalization/controllers/user_controller.dart';
import 'package:shopwithusama/features/shop/models/dummy_data.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../data/repositories/categories/category_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/network/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';
import '../../models/users/user_model.dart';

class LoginController extends GetxController{

  static LoginController get instance => Get.find();

  /// Variables -- Controllers for input fields
  final hidePassword = true.obs; // Observable for hiding/showing password
  final rememberMe = false.obs; // Observable for hiding/showing privacy
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());
  final categoryRepository = Get.put(CategoryRepository());


  @override
  void onInit() {
    email.text = localStorage.read("REMEMBER_ME_EMAIL") ?? "";
    password.text = localStorage.read("REMEMBER_ME_PASSWORD") ?? "";
    rememberMe.value = localStorage.read("REMEMBER_ME_STATUS") ?? false;
    super.onInit();
  }

  Future<void> emailAndPasswordSignIn() async {

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
      if(!loginFormKey.currentState!.validate()){
        // Remove Loader
        UFullScreenLoader.stopLoading();
        return;
      }

      // Save data if remember me is selected
      if(rememberMe.value){
        localStorage.write("REMEMBER_ME_STATUS", rememberMe.value);
        localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
        localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
      }else{
        localStorage.write("REMEMBER_ME_STATUS", rememberMe.value);
      }

      // Login user using email and password authentication
      final userCredential = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Upload dummy data
      //await categoryRepository.uploadDummyData(UDummyData.categories);

      // Remove Loader
      UFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();

    }catch(e) {
      // Remove Loader
      UFullScreenLoader.stopLoading();
      // Show some Generic Error to the user
      ULoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
      return;
    }
  }

  Future<void> googleSignIn() async {
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

      // Google Authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      // Save user record
      await userController.saveUserRecords(userCredentials);

      // Remove Loader
      UFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    }catch(e) {
      // Remove Loader
      UFullScreenLoader.stopLoading();
      // Show some Generic Error to the user
      ULoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
      return;
    }

  }
}