import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopwithusama/data/repositories/authentication/authentication_repository.dart';
import 'package:shopwithusama/data/repositories/user/user_repository.dart';
import 'package:shopwithusama/features/authentication/screens/login/login.dart';
import 'package:shopwithusama/features/personalization/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/popups/full_screen_loader.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/network/network_manager.dart';
import '../../../utils/popups/loaders.dart';
import '../../authentication/models/users/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  final GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecords();
  }

  // Save user records from any registration provider
  Future<void> saveUserRecords(UserCredential? userCredentials) async {
    try {

      // First update Rx user and then check if user data is already stored. If not store new data
      await fetchUserRecords();
      // If no record already stored
      if(user.value.id.isEmpty){
        if (userCredentials != null) {
          // Convert name to first and last name
          final nameParts =
          UserModel.nameParts(userCredentials.user?.displayName ?? '');
          final username =
          UserModel.generateUsername(userCredentials.user?.displayName ?? '');

          // Map Data
          final user = UserModel(
              id: userCredentials.user!.uid,
              firstName: nameParts[0],
              lastName:
              nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
              username: username,
              email: userCredentials.user!.email ?? '',
              phoneNumber: userCredentials.user!.phoneNumber ?? '',
              profilePicture: userCredentials.user!.photoURL ?? '');

          // Save user data
          await userRepository.saveUserRecord(user);
        }
      }

    } catch (e) {
      ULoaders.warningSnackBar(
          title: 'Data not saved',
          message:
              'Something went wrong while saving your information. You can re-save your data in your profile');
      return;
    }
  }

  // Delete account warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(USizes.md),
        title: 'Delete Account',
        middleText:
            'Are you sure you want to delete account permanently? This action is not reversible and all of your data will be removed permanently.',
        confirm: ElevatedButton(
            onPressed: () async => deleteAccount(),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red,side: const BorderSide(color: Colors.red)),
          child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: USizes.lg),
              child: Text('Delete'),
            ),
        ),
      cancel: OutlinedButton(onPressed: () => Navigator.of(Get.overlayContext!).pop(), child: const Text('Cancel'))
    );
  }

  void deleteAccount() async {
    try {
      UFullScreenLoader.openLoadingDialog('Processing', UImages.docerAnimation);

      /// First Re-Authenticate User
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e)=> e.providerId).first;
      if(provider.isNotEmpty){
        // Re verify auth email
        if(provider=='google.com'){
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          UFullScreenLoader.stopLoading();
          Get.offAll(()=> const LoginScreen());
        }else if(provider == 'password'){
          UFullScreenLoader.stopLoading();
          Get.to(()=> const ReAuthLoginForm());
        }
      }

    } catch (e) {
      UFullScreenLoader.stopLoading();
      ULoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
    }
  }

  // Fetch user records
  Future<void> fetchUserRecords() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }


  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      // Start Loading
      UFullScreenLoader.openLoadingDialog(
          "Processing...", UImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        UFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!reAuthFormKey.currentState!.validate()) {
        // Remove Loader
        UFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(verifyEmail.text.trim(),verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();


      // Remove Loader
      UFullScreenLoader.stopLoading();

      // Redirect
      Get.offAll(()=> const LoginScreen());
    } catch (e) {
      UFullScreenLoader.stopLoading();
      ULoaders.warningSnackBar(title: 'Oh Snap!',message: e.toString());
      return;
    }
  }

  uploadUserProfilePicture() async{

    try{
      final image = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 70,maxHeight: 512,maxWidth: 512);
      if(image != null){
        imageUploading.value = true;
        // Upload image
        final imageUrl = await userRepository.uploadImage('Users/Images/Profile/', image);

        // Update user image record
        // Update user first name & last name in the firestore
        Map<String,dynamic> json = {'ProfilePicture':imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();
        ULoaders.successSnackBar(title: 'Congratulations!',message: 'Your profile image has been updated!');
      }
    }catch (e) {
      ULoaders.warningSnackBar(title: 'Oh Snap!',message: 'Something went wrong $e');
      return;
    }finally{
      imageUploading.value = false;
    }

  }

}
