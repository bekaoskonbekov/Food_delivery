
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/product_entity.dart';
import 'category_model.dart';

class ProductDataModel extends ProductData {
 const  ProductDataModel({
    required String id,
    required String name,
    required String description,
    required double price,
    required double discount,
    required double rate,
    required int countInStock,
    required CategoryData category,
    required String brand,
    required List<String> images,
    required String color,
  }) : super(
            id: id,
            name: name,
            description: description,
            price: price,
            discount: discount,
            rate: rate,
            countInStock: countInStock,
            category: category,
            brand: brand,
            images: images,
            color: color);

  factory ProductDataModel.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      return ProductDataModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        price: (json['price'] as num?)!.toDouble(),
        discount: (json['discount'] as num?)!.toDouble(),
        rate: (json['rate'] as num?)!.toDouble(),
        countInStock: (json['countInStock'] as num?)!.toInt(),
        category:
            CategoryDataModel.fromJson(json['category'] as Map<String, dynamic>?),
        brand: json['brand'],
        images:   toStringList(json['images'] as List<dynamic>),
        color: json['color'],
      );
    }
    return ProductDataModel(
      id: '',
      name: '',
      description: '',
      price: 0.0,
      discount: 0.0,
      rate: 0.0,
      countInStock: 0,
      category: CategoryDataModel.empty(),
      brand: '',
      images: const [],
      color: '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'discount': discount,
      'rate': rate,
      'countInStock': countInStock,
      'category': (category as CategoryDataModel).toJson(),
      'brand': brand,
      'images': images,
      'color': color,
    };
  }
}
  List<String> toStringList(List<dynamic>? list) {
    if (list != null) {
      return list.map((imageUrl) {
        if (imageUrl != null) {
          return imageUrl.toString();
        }
        return '';
      }).toList();
    }
    return <String>[];
  }

