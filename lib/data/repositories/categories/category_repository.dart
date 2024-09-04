import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shopwithusama/features/shop/models/category_model.dart';

import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../services/firebase_storage_service.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;
  
  /// Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try{
      final snapshot = await _db.collection("Categories").get();
      final list = snapshot.docs.map((document) => CategoryModel.fromSnapShot(document)).toList();
      return list;
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    }catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

  /// Get sub categories
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try{
      final snapshot = await _db.collection("Categories").where('ParentId',isEqualTo: categoryId).get();
      final result = snapshot.docs.map((document) => CategoryModel.fromSnapShot(document)).toList();
      return result;
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    }catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

  /// Upload categories to the cloud firestore
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try{
      final storage = Get.put(UFirebaseStorageService());

      // Loop through each category
      for(var category in categories){
        final file = await storage.getImageDataFromAssets(category.image);

        final url = await storage.uploadImageData('Categories',file,category.name);

        category.image = url;

        await _db.collection("Categories").doc(category.id).set(category.toJson());
      }
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    }catch(e){
      throw 'Something went wrong. Please try again';
    }
  }
}
