import 'package:equatable/equatable.dart';

class CategoryData extends Equatable {
  final String id;
  final String name;
  final String image;

  const CategoryData({
    required this.id,
    required this.name,
    required this.image,
  });
  

  @override
  List<Object?> get props => [
        id,
        name,
        image,
      ];
}
