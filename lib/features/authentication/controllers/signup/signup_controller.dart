import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shopwithusama/data/repositories/authentication/authentication_repository.dart';
import 'package:shopwithusama/data/repositories/user/user_repository.dart';
import 'package:shopwithusama/features/authentication/models/users/user_model.dart';
import 'package:shopwithusama/features/authentication/screens/signup/verify_email.dart';
import 'package:shopwithusama/utils/constants/image_strings.dart';
import 'package:shopwithusama/utils/network/network_manager.dart';
import 'package:shopwithusama/utils/popups/full_screen_loader.dart';
import 'package:shopwithusama/utils/popups/loaders.dart';

class SignupController extends GetxController {

  static SignupController get instance => Get.find();

  /// Variables -- Controllers for input fields
  final hidePassword = true.obs; // Observable for hiding/showing password
  final privacyPolicy = false.obs; // Observable for hiding/showing privacy
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> singupFormKey = GlobalKey<FormState>();

  /// -- SIGNUP
  Future<void> signup() async {

    try{
      // Start Loading
      UFullScreenLoader.openLoadingDialog("We are processing your information...", UImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        // Remove Loader
        UFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if(!singupFormKey.currentState!.validate()){
        // Remove Loader
        UFullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy Check
      if(!privacyPolicy.value){
        ULoaders.warningSnackBar(title: 'Accept Privacy Policy', message: 'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use.');
        return;
      }

      // Register user in the Firebase Authentication & Save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Save Authenticated user data in the Firebase Firestore
      final newUser = UserModel(id: userCredential.user!.uid, firstName: firstName.text.trim(), lastName: lastName.text.trim(), username: username.text.trim(), email: email.text.trim(), phoneNumber: phoneNumber.text.trim(), profilePicture: '');

      final userRepository = Get.put(UserRepository());
      userRepository.saveUserRecord(newUser);


      // Remove Loader
      UFullScreenLoader.stopLoading();

      // Show Success Message
      ULoaders.successSnackBar(title: 'Congratulations',message: 'Your account has been created! Verify email to continue.');

      // Move to Verify Email Screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim(),));
    }catch(e) {
      // Remove Loader
      UFullScreenLoader.stopLoading();
      // Show some Generic Error to the user
      ULoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
      return;
    }
  }

}