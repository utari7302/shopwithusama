import 'package:get/get.dart';
import 'package:shopwithusama/data/repositories/categories/category_repository.dart';
import 'package:shopwithusama/features/shop/models/product.dart';

import '../../../data/repositories/products/product_repository.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';
import '../models/category_model.dart';

class CategoryController extends GetxController{
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// Load category data
  Future<void> fetchCategories() async {
    try{
      // Show loader while loading categories
      isLoading.value = true;

      // Fetch categories from data source
      final categories = await _categoryRepository.getAllCategories();

      // Update the categories list
      allCategories.assignAll(categories);

      // Filter featured categories
      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());

    }catch(e) {
      ULoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
      return;
    }finally{
      isLoading.value = false;
    }
  }

  /// Load selected category data

  /// Get category or sub-category products
  Future<List<ProductModel>> getCategoryProducts({required String categoryId,int limit = 4}) async {
    try{
      final products = await ProductRepository.instance.getProductForCategory(categoryId: categoryId,limit: limit);
      return products;
    }catch(e){
      ULoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
      return [];
    }
  }

}