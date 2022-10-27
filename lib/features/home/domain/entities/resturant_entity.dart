import 'package:equatable/equatable.dart';

class ResturantData extends Equatable {
  final String id;
  final int reviews;
  final String location;
  final String phone;
  final String image;
  final String restaurantType;
  final String businessname;
  final String address;
  final String slug;

  const ResturantData({
    required this.id,
    required this.reviews,
    required this.location,
    required this.phone,
    required this.image,
    required this.restaurantType,
    required this.businessname,
    required this.address,
    required this.slug,
  });

  @override
  List<Object?> get props => [
        id,
        reviews,
        location,
        phone,
        image,
        restaurantType,
        businessname,
        address,
        slug,
      ];
}
