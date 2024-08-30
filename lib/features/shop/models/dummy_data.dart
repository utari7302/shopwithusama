import 'package:shopwithusama/features/shop/models/banner_model.dart';
import 'package:shopwithusama/features/shop/models/brand_model.dart';
import 'package:shopwithusama/features/shop/models/product.dart';
import 'package:shopwithusama/features/shop/models/product_attribute_model.dart';
import 'package:shopwithusama/features/shop/models/product_variation_model.dart';
import 'package:shopwithusama/routes/routes.dart';

import '../../../utils/constants/image_strings.dart';
import 'category_model.dart';

class UDummyData {
  /// -- Banners
  static final List<BannerModel> banners = [
    BannerModel(
        imageUrl: UImages.promoBanner1,
        targetScreen: URoutes.order,
        active: true),
    BannerModel(
        imageUrl: UImages.promoBanner2,
        targetScreen: URoutes.cart,
        active: true),
    BannerModel(
        imageUrl: UImages.promoBanner3,
        targetScreen: URoutes.favourites,
        active: true),
    BannerModel(
        imageUrl: UImages.banner1,
        targetScreen: URoutes.search,
        active: true),
    BannerModel(
        imageUrl: UImages.banner2,
        targetScreen: URoutes.settings,
        active: true),
    BannerModel(
        imageUrl: UImages.banner3,
        targetScreen: URoutes.userAddress,
        active: true),
    BannerModel(
        imageUrl: UImages.banner4,
        targetScreen: URoutes.checkout,
        active: true),
  ];

  /// -- List of all Categories
  static final List<CategoryModel> categories = [
    CategoryModel(
        id: '1', name: 'Sports', image: UImages.sportIcon, isFeatured: true),
    CategoryModel(
        id: '5',
        name: 'Furniture',
        image: UImages.furnitureIcon,
        isFeatured: true),
    CategoryModel(
        id: '2',
        name: 'Electronics',
        image: UImages.electronicsIcon,
        isFeatured: true),
    CategoryModel(
        id: '3', name: 'Clothes', image: UImages.clothIcon, isFeatured: true),
    CategoryModel(
        id: '4', name: 'Animals', image: UImages.animalIcon, isFeatured: true),
    CategoryModel(
        id: '6', name: 'Shoes', image: UImages.shoeIcon, isFeatured: true),
    CategoryModel(
        id: '7',
        name: 'Cosmetics',
        image: UImages.cosmeticsIcon,
        isFeatured: true),
    CategoryModel(
        id: '14',
        name: 'Jewellery',
        image: UImages.jeweleryIcon,
        isFeatured: true),

    /// Sub Categories
    CategoryModel(
        id: '8',
        name: 'Sport Shoes',
        image: UImages.sportIcon,
        parentId: '1',
        isFeatured: true),
    CategoryModel(
        id: '9',
        name: 'Track Suits',
        image: UImages.sportIcon,
        parentId: '1',
        isFeatured: true),
    CategoryModel(
        id: '10',
        name: 'Sports Equipment',
        image: UImages.sportIcon,
        parentId: '1',
        isFeatured: true),

    /// Furniture
    CategoryModel(
        id: '11',
        name: 'Bedroom furniture',
        image: UImages.furnitureIcon,
        parentId: '1',
        isFeatured: true),
    CategoryModel(
        id: '12',
        name: 'Kitchen furniture',
        image: UImages.furnitureIcon,
        parentId: '1',
        isFeatured: true),
    CategoryModel(
        id: '13',
        name: 'Office furniture',
        image: UImages.furnitureIcon,
        parentId: '1',
        isFeatured: true),
  ];

  /// -- List of all Brands
  static final List<BrandModel> brands = [
    BrandModel(id: '1', name: 'Nike', image: UImages.nikeLogo,isFeatured: true,productsCount: 256),
    BrandModel(id: '2', name: 'Adidas', image: UImages.adidasLogo,isFeatured: true,productsCount: 95),
    BrandModel(id: '3', name: 'Jordan', image: UImages.jordanLogo,isFeatured: true,productsCount: 36),
    BrandModel(id: '4', name: 'Puma', image: UImages.pumaLogo,isFeatured: true,productsCount: 65),
    BrandModel(id: '5', name: 'Apple', image: UImages.appleLogo,isFeatured: true,productsCount: 65),
    BrandModel(id: '6', name: 'Zara', image: UImages.zaraLogo,isFeatured: false,productsCount: 65),
    BrandModel(id: '7', name: 'Kenwood', image: UImages.kenwoodLogo,isFeatured: false,productsCount: 65),
    BrandModel(id: '8', name: 'Herman Miller', image: UImages.hermanMillerLogo,isFeatured: false,productsCount: 65),
    BrandModel(id: '9', name: 'Ikea', image: UImages.ikeaLogo,isFeatured: false,productsCount: 65),
    BrandModel(id: '410', name: 'Acer', image: UImages.acerlogo,isFeatured: false,productsCount: 65),
  ];

  /// -- List of all Products
  static final List<ProductModel> products = [
    ProductModel(
      id: '001',
      title: 'Green Nike sports shoe',
      stock: 15,
      price: 135,
      isFeatured: true,
      thumbnail: UImages.productImage1,
      description: 'Green Nike sports shoe',
      brand: BrandModel(
          id: '1',
          image: UImages.productImage1,
          name: 'Nike',
          productsCount: 256,
          isFeatured: true),
      images: [
        UImages.productImage1,UImages.productImage21,UImages.productImage9
      ],

      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green','Black', 'Red']),
        ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 34,
          price: 134,
          salePrice:122.6,
          image: UImages.productImage1,
          description: 'THis is a product description for green nike sports shoe.',
          attributeValues: {'Color': 'Green', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 15,
          price: 132,
          image: UImages.productImage23,
          attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 0,
          price: 234,
          image: UImages.productImage23,
          attributeValues: {'Color': 'Black', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 222,
          price: 232,
          image: UImages.productImage1,
          attributeValues: {'Color': 'Green', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '5',
          stock: 0,
          price: 334,
          image: UImages.productImage21,
          attributeValues: {'Color': 'Red', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '6',
          stock: 11,
          price: 332,
          image: UImages.productImage21,
          attributeValues: {'Color': 'Red', 'Size': 'EU 32'},
        ),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '002',
      title: 'Green Nike sports shoe',
      stock: 15,
      price: 135,
      isFeatured: true,
      thumbnail: UImages.productImage3,
      description: 'Green Nike sports shoe',
      brand: BrandModel(
          id: '6',
          image: UImages.productImage23,
          name: 'ZARA'),
      images: [
        UImages.productImage5,UImages.productImage6,UImages.productImage7
      ],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green','Blue', 'Red']),
        ProductAttributeModel(name: 'Size', values: [ 'EU 32', 'EU 34']),
      ],
      productType: 'ProductType.single',
    ),
  ];
}
