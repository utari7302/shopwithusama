import 'package:get/get.dart';
import 'package:shopwithusama/data/repositories/banners/banner_repository.dart';

import '../../../utils/popups/loaders.dart';
import '../models/banner_model.dart';

class BannerController extends GetxController{

  static BannerController get instance => Get.find();

  /// Variables
  final carousalCurrentIndex = 0.obs;
  final isLoading = false.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;


  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  /// Update Page Navigational Dots
  void updatePageIndicator(index){
    carousalCurrentIndex.value = index;
  }

  /// Fetch Banners
  Future<void> fetchBanners() async {
    try{
      // Show loader while loading categories
      isLoading.value = true;

      /// Fetch Banner
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      /// Assign Banners
      this.banners.assignAll(banners);


    }catch(e) {
      ULoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
      return;
    }finally{
      isLoading.value = false;
    }
  }

}