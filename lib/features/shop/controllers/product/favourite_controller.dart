import 'dart:convert';

import 'package:get/get.dart';
import 'package:shopwithusama/data/repositories/products/product_repository.dart';
import 'package:shopwithusama/features/shop/models/product.dart';
import 'package:shopwithusama/utils/local_storage/storage_utility.dart';
import 'package:shopwithusama/utils/popups/loaders.dart';

class FavouriteController extends GetxController{
  static FavouriteController get instance => Get.find();

  /// Variable
  final favorites = <String,bool>{}.obs;


  @override
  void onInit() {
    super.onInit();
    initFavorites();
  }

  // Method to initialize favorites by reading from storage
  void initFavorites() {
    final json = ULocalStorage.instance().readData('favorites');
    if(json != null){
      final storedFavorites = jsonDecode(json) as Map<String,dynamic>;
      favorites.assignAll(storedFavorites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavourite(String productId){
    return favorites[productId] ?? false;
  }

  void toggleFavoriteProduct(String productId){
    if(!favorites.containsKey(productId)){
      favorites[productId] = true;
      saveFavoritesToStorage();
      ULoaders.successSnackBar(title: 'Product has been added to the wishlist');
    }else{
      ULocalStorage.instance().removeData(productId);
      favorites.remove(productId);
      saveFavoritesToStorage();
      favorites.refresh();
      ULoaders.successSnackBar(title: 'Product has been removed from the wishlist');
    }
  }

  void saveFavoritesToStorage(){
    final encodedFavorites = json.encode(favorites);
    ULocalStorage.instance().saveData('favorites', encodedFavorites);
  }

  Future<List<ProductModel>> favoriteProducts() async {
    return await ProductRepository.instance.getFavouriteProducts(favorites.keys.toList());
  }

}