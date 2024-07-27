import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shopwithusama/data/repositories/user/user_repository.dart';
import 'package:shopwithusama/features/personalization/controllers/user_controller.dart';
import 'package:shopwithusama/features/personalization/screens/profile/profile.dart';
import 'package:shopwithusama/utils/popups/loaders.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/network/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';

class UpdateNameController extends GetxController{
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  final GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  // init user data when home screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }


  Future<void> updateUserName() async {
    try{
      // Start Loading
      UFullScreenLoader.openLoadingDialog("We're updating your information...", UImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        // Remove Loader
        UFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if(!updateUserNameFormKey.currentState!.validate()){
        // Remove Loader
        UFullScreenLoader.stopLoading();
        return;
      }

      // Update user first name & last name in the firestore
      Map<String,dynamic> name = {'FirstName':firstName.text.trim(),'LastName':lastName.text.trim()};
      await userRepository.updateSingleField(name);

      // Update the Rx user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // Remove Loader
      UFullScreenLoader.stopLoading();

      // Show success screen
      ULoaders.successSnackBar(title: 'Congratulations',message: 'Your name has been updated.');

      // Move to previous screen
      Get.off(()=> const ProfileScreen());

    }catch(e){
      // Remove Loader
      UFullScreenLoader.stopLoading();
      ULoaders.errorSnackBar(title: 'Oh Snap',message: e.toString());

    }
  }




}