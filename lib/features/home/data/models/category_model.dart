
import '../../domain/entities/category_entity.dart';

class CategoryDataModel extends CategoryData {
  const CategoryDataModel({
    required String id,
    required String name,
    required String image,
  }) : super(
          id: id,
          name: name,
          image: image,
        );

  factory CategoryDataModel.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      return CategoryDataModel(
        id: json['id'],
        name: json['name'],
        image: json['image'],
      );
    }
    return const CategoryDataModel(
      id: '',
      name: '',
      image: '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory CategoryDataModel.empty() {
    return const CategoryDataModel(
      id: '',
      name: '',
      image: '',
    );
  }
}
