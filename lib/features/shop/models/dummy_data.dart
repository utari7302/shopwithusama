import '../../../utils/constants/image_strings.dart';
import 'category_model.dart';

class UDummyData{

  static final List<CategoryModel> categories =  [
    CategoryModel(id: '1', name: 'Sports', image: UImages.sportIcon, isFeatured: true),
    CategoryModel(id: '2', name: 'Furniture', image: UImages.furnitureIcon, isFeatured: true),
    CategoryModel(id: '3', name: 'Electronics', image: UImages.electronicsIcon, isFeatured: true),
    CategoryModel(id: '4', name: 'Clothes', image: UImages.clothIcon, isFeatured: true),
    CategoryModel(id: '5', name: 'Animals', image: UImages.animalIcon, isFeatured: true),
    CategoryModel(id: '6', name: 'Shoes', image: UImages.shoeIcon, isFeatured: true),
    CategoryModel(id: '7', name: 'Cosmetics', image: UImages.cosmeticsIcon, isFeatured: true),
    CategoryModel(id: '8', name: 'Jewellery', image: UImages.jeweleryIcon, isFeatured: true)
  ];

}