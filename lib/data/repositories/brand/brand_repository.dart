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