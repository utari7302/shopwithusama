import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shopwithusama/data/repositories/user/user_repository.dart';

import '../../../utils/popups/loaders.dart';
import '../../authentication/models/users/user_model.dart';

class UserController extends GetxController{
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  // Save user records from any registration provider
  Future<void> saveUserRecords(UserCredential? userCredentials) async{
    try{
      if(userCredentials !=null){
        // Convert name to first and last name
        final nameParts = UserModel.nameParts(userCredentials.user?.displayName??'');
        final username = UserModel.generateUsername(userCredentials.user?.displayName??'');

        // Map Data
        final user = UserModel(id: userCredentials.user!.uid, firstName: nameParts[0], lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '', username: username, email: userCredentials.user!.email ?? '', phoneNumber: userCredentials.user!.phoneNumber ?? '', profilePicture: userCredentials.user!.photoURL ?? '');

        await userRepository.saveUserRecord(user);

      }
    }catch(e){
      ULoaders.warningSnackBar(title: 'Data not saved',message: 'Something went wrong while saving your information. You can re-save your data in your profile');
      return;
    }
  }
}