import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shopwithusama/features/shop/models/brand_model.dart';

import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../services/firebase_storage_service.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  /// Variable
  final _db = FirebaseFirestore.instance;

  /// Get all categories
  Future<List<BrandModel>> getAllBrands() async{
    try{
      final snapshot = await _db.collection('Brands').get();
      final result = snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
      return result;
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    }catch(e){
      throw 'Something went wrong. Please try again';
    }
  }


  /// Get brands for category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async{
    try{
      // Query to get all documents where categoryId matches the provided categoryId
      QuerySnapshot brandCategoryQuery = await _db.collection('BrandCategory').where('categoryId',isEqualTo: categoryId).get();

      // Extract brandIds from the documents
      List<String> brandIds = brandCategoryQuery.docs.map((doc) => doc['brandId'] as String).toList();

      // Query to get all documents where the brandId is in the list of brandIds, FieldPath.documentId to query documents in collection
      final brandsQuery = await _db.collection('Brands').where(FieldPath.documentId,whereIn: brandIds).limit(2).get();

      // Extract brand names or other relevant data from the documents
      List<BrandModel> brands = brandsQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();

      return brands;
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    }catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

  /// Upload brands to the cloud firestore
  Future<void> uploadDummyData(List<BrandModel> brands) async {
    try{
      final storage = Get.put(UFirebaseStorageService());

      // Loop through each category
      for(var brand in brands){
        final file = await storage.getImageDataFromAssets(brand.image);

        final url = await storage.uploadImageData('Brands',file,brand.name);

        brand.image = url;

        await _db.collection("Brands").doc(brand.id).set(brand.toJson());
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