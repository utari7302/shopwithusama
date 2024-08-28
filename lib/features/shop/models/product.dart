import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopwithusama/features/shop/models/brand_model.dart';
import 'package:shopwithusama/features/shop/models/product_attribute_model.dart';
import 'package:shopwithusama/features/shop/models/product_variation_model.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;

  ProductModel({
    required this.id,
    required this.stock,
    this.sku = '',
    required this.price,
    required this.title,
    this.date,
    this.salePrice = 0.0,
    required this.thumbnail,
    this.isFeatured = false,
    this.brand,
    this.description = '',
    this.categoryId = '',
    this.images,
    required this.productType,
    this.productAttributes,
    this.productVariations,
  });

  /// Empty Helper Function
  static ProductModel empty() => ProductModel(id: '', title: '', stock: 0, price: 0, thumbnail: '', productType: '');

  /// Convert model to Json structure so that you can store data in Firebase
  Map<String, dynamic> toJson() {
    return {
    'Id': id,
    'Stock': stock,
    'Sku': sku,
    'Price': price,
    'Title': title,
    'Date': date?.toIso8601String(),
    'SalePrice': salePrice,
    'Thumbnail': thumbnail,
    'IsFeatured': isFeatured,
    'Brand': brand?.toJson(),
    'Description': description,
    'CategoryId': categoryId,
    'Images': images,
    'ProductType': productType,
    'ProductAttributes': productAttributes != null ? productAttributes!.map((e) => e.toJson()).toList() : [],
    'ProductVariations': productVariations != null ? productVariations!.map((e) => e.toJson()).toList() : [],
  };
  }

  /// Map Json oriented document snapshot from Firebase to ProductModel
  factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document) {
    if(document.data() == null) return ProductModel.empty();
    final data = document.data()!;
    return ProductModel(
      id: document.id,
      sku: data['Sku'],
      title: data['Title'] ?? '',
      stock: data['Stock'] ?? 0,
      isFeatured: data['IsFeatured'] ?? false,
      price: double.parse((data['Price'] ?? 0.0).toString()),
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      thumbnail: data['Thumbnail'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      description: data['Description'] ?? '',
      productType: data['ProductType'] ?? '',
      brand: data['Brand'] != null ? BrandModel.fromJson(data['Brand']) : null,
      images: List<String>.from(data['Images'] ?? []),
      productAttributes: (data['ProductAttributes'] as List<dynamic>)
          .map((item) => ProductAttributeModel.fromJson(item))
          .toList(),
      productVariations: (data['ProductVariations'] as List<dynamic>)
          .map((item) => ProductVariationModel.fromJson(item))
          .toList(),
    );
  }


  factory ProductModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String,dynamic>;
    return ProductModel(
      id: document.id,
      stock: data['Stock'] ?? 0,
      sku: data['Sku'],
      price: double.parse((data['Price'] ?? 0.0).toString()),
      title: data['Title'] ?? '',
      date: data['Date'] != null ? DateTime.parse(data['Date']) : null,
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      thumbnail: data['Thumbnail'] ?? '',
      isFeatured: data['IsFeatured'] ?? false,
      brand: data['Brand'] != null ? BrandModel.fromJson(data['Brand']) : null,
      description: data['Description'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      images: List<String>.from(data['Images'] ?? []),
      productType: data['ProductType'] ?? '',
      productAttributes: (data['ProductAttributes'] as List<dynamic>)
          .map((item) => ProductAttributeModel.fromJson(item))
          .toList(),
      productVariations: (data['ProductVariations'] as List<dynamic>)
          .map((item) => ProductVariationModel.fromJson(item))
          .toList(),
    );
  }
}
