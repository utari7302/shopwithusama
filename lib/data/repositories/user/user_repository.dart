import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopwithusama/data/repositories/authentication/authentication_repository.dart';
import 'package:shopwithusama/features/authentication/models/users/user_model.dart';

import '../../../utils/exceptions/firebase_auth_exception.dart';
import '../../../utils/exceptions/firebase_exception.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user data to firestore
  Future<void> saveUserRecord(UserModel user) async {
    try{
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    }catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

  /// Function to fetch user details based on user ID
  Future<UserModel> fetchUserDetails() async {
    try{
      final documentSnapshot = await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).get();
      if(documentSnapshot.exists){
        return UserModel.fromSnapshot(documentSnapshot);
      }else{
        return UserModel.empty();
      }
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    }catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

  /// Function to update user data in firestore
  Future<void> updateUserDetails(UserModel updateUser) async {
    try{
      await _db.collection("Users").doc(updateUser.id).update(updateUser.toJson());
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    }catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

  /// Update any field in specific user collection
  Future<void> updateSingleField(Map<String,dynamic> json) async {
    try{
      await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).update(json);
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    }catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

  /// Function to remove user data from firestore
  Future<void> removeUserRecord(String userId) async {
    try{
      await _db.collection("Users").doc(userId).delete();
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    }catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

  /// Upload image
  Future<String> uploadImage(String path,XFile image) async {
    try{
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = ref.getDownloadURL();
      return url;
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    }catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

}