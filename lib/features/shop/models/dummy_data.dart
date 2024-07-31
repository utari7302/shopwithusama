import '../../../utils/constants/image_strings.dart';
import 'category_model.dart';

class UDummyData{

  static final List<CategoryModel> categories =  [
    CategoryModel(id: '1', name: 'Sports', image: UImages.sportIcon, isFeatured: true),
    CategoryModel(id: '5', name: 'Furniture', image: UImages.furnitureIcon, isFeatured: true),
    CategoryModel(id: '2', name: 'Electronics', image: UImages.electronicsIcon, isFeatured: true),
    CategoryModel(id: '3', name: 'Clothes', image: UImages.clothIcon, isFeatured: true),
    CategoryModel(id: '4', name: 'Animals', image: UImages.animalIcon, isFeatured: true),
    CategoryModel(id: '6', name: 'Shoes', image: UImages.shoeIcon, isFeatured: true),
    CategoryModel(id: '7', name: 'Cosmetics', image: UImages.cosmeticsIcon, isFeatured: true),
    CategoryModel(id: '14', name: 'Jewellery', image: UImages.jeweleryIcon, isFeatured: true),

    /// Sub Categories
    CategoryModel(id: '8', name: 'Sport Shoes', image: UImages.sportIcon, parentId: '1', isFeatured: true),
    CategoryModel(id: '9', name: 'Track Suits', image: UImages.sportIcon, parentId: '1', isFeatured: true),
    CategoryModel(id: '10', name: 'Sports Equipment', image: UImages.sportIcon, parentId: '1', isFeatured: true),

    /// Furniture
    CategoryModel(id: '11', name: 'Bedroom furniture', image: UImages.furnitureIcon, parentId: '1', isFeatured: true),
    CategoryModel(id: '12', name: 'Kitchen furniture', image: UImages.furnitureIcon, parentId: '1', isFeatured: true),
    CategoryModel(id: '13', name: 'Office furniture', image: UImages.furnitureIcon, parentId: '1', isFeatured: true),

  ];

}