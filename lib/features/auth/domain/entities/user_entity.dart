import 'package:equatable/equatable.dart';

import '../../../home/domain/entities/product_entity.dart';


class UserData extends Equatable {
  final String id;
  final String email;
  final String name;
  final String phone;
  final String password;
  final String governorate;
  final String city;
  final String street;
  final String postalCode;
  final String imageUrl;
  final List<ProductData> favorites;
  final List<Map<String, dynamic>> cartProducts;
  final String memberSince;
  const UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.city,
    required this.cartProducts,
    required this.favorites,
    required this.street,
    required this.governorate,
    required this.imageUrl,
    required this.memberSince,
    required this.postalCode,
  });

  UserData copyWith({
    String? id,
    String? email,
    String? name,
    String? phone,
    String? password,
    String? governorate,
    String? city,
    String? street,
    String? postalCode,
    String? imageUrl,
    List<ProductData>? favorites,
    List<Map<String, dynamic>>? cartProducts,
    String? memberSince,
  }) {
    return UserData(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      governorate: governorate ?? this.governorate,
      city: city ?? this.city,
      street: street ?? this.street,
      postalCode: postalCode ?? this.postalCode,
      imageUrl: imageUrl ?? this.imageUrl,
      favorites: favorites ?? this.favorites,
      cartProducts: cartProducts ?? this.cartProducts,
      memberSince: memberSince ?? this.memberSince,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        name,
        password,
        email,
        city,
        cartProducts,
        favorites,
        memberSince,
        imageUrl,
        street,
        postalCode,
        phone,
        id,
        governorate,
      ];
}
