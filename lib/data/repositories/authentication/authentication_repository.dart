import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shopwithusama/features/authentication/screens/login/login.dart';
import 'package:shopwithusama/features/authentication/screens/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController {

  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to Show Relevant Screen
  screenRedirect() async {
    // Local Storage
    deviceStorage.writeIfNull("IsFirstTime", true);
    // Get.offAll move to specific screen and remove all previous screens
    deviceStorage.read("IsFirstTime") != true ? Get.offAll(() => const LoginScreen()) : Get.offAll(() => const OnBoardingScreen());
  }

  /* ------------------------------ Email & Password sign-in -------------------------------------------- */

  /// [EmailAuthentication] - SignIn
  /// [EmailAuthentication] - Register
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try{
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
  /// [EmailAuthentication] - ReAuthentication User
  /// [EmailAuthentication] - Mail Verification
  /// [EmailAuthentication] - Forget Password
  /// [EmailAuthentication] - SignIn
}