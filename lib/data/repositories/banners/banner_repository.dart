import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../../features/shop/models/banner_model.dart';
import '../../../utils/exceptions/firebase_auth_exception.dart';
import '../../../utils/exceptions/firebase_exception.dart';
import '../../services/firebase_storage_service.dart';

class BannerRepository extends GetxController{
  static BannerRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all order related to current user


  /// Upload banners to the cloud firestore
  Future<List<BannerModel>> fetchBanners() async {
    try{
      final result = await _db.collection('Banners').where('active',isEqualTo: true).get();
      return result.docs.map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot)).toList();
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    }catch(e){
      throw 'Something went wrong. Please try again';
    }
  }


  Future<void> uploadDummyData(List<BannerModel> banners) async {
    try{
      final storage = Get.put(UFirebaseStorageService());
      final uuid = Uuid();
      // Loop through each category
      for(var banner in banners){
        final file = await storage.getImageDataFromAssets(banner.imageUrl);

        // Generate a unique name
        final uniqueName = '${uuid.v4()}_${DateTime.now().millisecondsSinceEpoch}';

        final url = await storage.uploadImageData('Banners',file,uniqueName);

        banner.imageUrl = url;

        await _db.collection("Banners").doc(uniqueName).set(banner.toJson());
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