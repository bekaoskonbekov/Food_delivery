import '../../domain/entities/resturant_entity.dart';

class ResturantDataModel extends ResturantData {
  const ResturantDataModel({
    required String id,
    required int reviews,
    required String location,
    required String phone,
    required String image,
    required String restaurantType,
    required String businessName,
    required String address,
    required String slug,
  }) : super(
            id: id,
            reviews: reviews,
            location: location,
            phone: phone,
            image: image,
            restaurantType: restaurantType,
            businessname: businessName,
            address: address,
            slug: slug);

  factory ResturantDataModel.fromJson(Map<String, dynamic> json) {
    return ResturantDataModel(
      id: json['id'],
      reviews: json['reviews'],
      location: json['location'],
      phone: json['phone'],
      image: json['image'],
      restaurantType: json['restauranttype'],
      businessName: json['businessname'],
      address: json['address'],
      slug: json['slug'],
    );
  }
}
