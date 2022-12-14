import 'package:equatable/equatable.dart';

import 'category_entity.dart';

class ProductData extends Equatable {
  final String id;
  final String name;
  final String description;
  final double price;
  final double discount;
  final double rate;
  final int countInStock;
  final CategoryData category;
  final String brand;
  final List<String> images;
  final String color;

   const ProductData({
    
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.discount,
    required this.rate,
    required this.countInStock,
    required this.category,
    required this.brand,
    required this.images,
    required this.color,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        price,
        discount,
        rate,
        countInStock,
        category,
        brand,
        images,
        color,
      ];

      

}
