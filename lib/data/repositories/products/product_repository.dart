import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shopwithusama/features/shop/models/product.dart';

import '../../../utils/exceptions/firebase_auth_exception.dart';
import '../../../utils/exceptions/firebase_exception.dart';
import '../../services/firebase_storage_service.dart';

class ProductRepository extends GetxController{
  static ProductRepository get instance => Get.find();

  /// Firestore instance for database interactions
  final _db = FirebaseFirestore.instance;

  /// Get limited featured products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try{
      final snapshot = await _db.collection('Products').where('IsFeatured',isEqualTo: true).limit(4).get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    }catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

  /// Get all featured products
  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try{
      final snapshot = await _db.collection('Products').where('IsFeatured',isEqualTo: true).get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    }catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try{
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs.map((doc) => ProductModel.fromQuerySnapshot(doc)).toList();
      return productList;
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    }catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

  /// Upload dummy data to the Cloud Firebase
  Future<void> uploadDummyData(List<ProductModel> products) async {
    try{
      final storage = Get.put(UFirebaseStorageService());

      // Loop through each category
      for(var product in products){
        // Get image data link from local assets
        final thumbnail = await storage.getImageDataFromAssets(product.thumbnail);

        // Upload image and get its url
        final url = await storage.uploadImageData('Products/Images',thumbnail,product.thumbnail.toString());

        // Assign URL to product.thumbnail attribute
        product.thumbnail = url;

        // Product list of images
        if(product.images != null && product.images!.isNotEmpty){
          List<String> imagesUrl = [];
          for(var image in product.images!){
            // Get image data link from local assets
            final assetImage = await storage.getImageDataFromAssets(image);

            // Upload image and get its url
            final url = await storage.uploadImageData('Products/Images',assetImage,image);

            // Assign URL to product.thumbnail attribute
            imagesUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imagesUrl);
        }


        // Upload Variation Images
        if(product.productType == 'ProductType.variable'){
          for(var variation in product.productVariations!){
            // Get image data link from local assets
            final assetImage = await storage.getImageDataFromAssets(variation.image);

            // Upload image and get its url
            final url = await storage.uploadImageData('Products/Images',assetImage,variation.image);

            // Assign URL to product.thumbnail attribute
            variation.image = url;
          }
        }
        // Store product in Firestore
        await _db.collection("Products").doc(product.id).set(product.toJson());

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