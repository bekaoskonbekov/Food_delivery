import '../../../home/data/models/product_model.dart';
import '../../../home/domain/entities/product_entity.dart';
import '../../domain/entities/user_entity.dart';

class UserDataModel extends UserData {
  UserDataModel({
    required String id,
    required String name,
    required String email,
    required String password,
    String phone = '',
    String city = '',
    List<Map<String, dynamic>> cartProducts = const [],
    List<ProductData> favorites = const [],
    String street = '',
    String governorate = '',
    String imageUrl = '',
    required String memberSince,
    String postalCode = '',
  }) : super(
            id: id,
            name: name,
            email: email,
            password: password,
            phone: phone,
            city: city,
            cartProducts: cartProducts,
            favorites: favorites,
            street: street,
            governorate: governorate,
            imageUrl: imageUrl,
            memberSince: memberSince,
            postalCode: postalCode);

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      final List<ProductDataModel> favorites = [];
      if (json['favorites'] != null) {
        final favoritesJson = json['favorites'];
        for (var product in favoritesJson) {
          favorites.add(ProductDataModel.fromJson(product));
        }
      }

      final List<Map<String, dynamic>> cartProducts = [];
      if (json['cartProducts'] != null) {
        final cartProductsJson = json['cartProducts'];
        for (var product in cartProductsJson) {
          cartProducts.add({
            'product': ProductDataModel.fromJson(product['product']),
            'count': product['count'],
          });
        }
      }
      return UserDataModel(
          id: json['id'],
          name: json['name'],
          email: json['email'],
          password: json['password'],
          memberSince: json['memberSince'],
          cartProducts: cartProducts,
          favorites: favorites,
          city: json['city'],
          governorate: json['governorate'],
          street: json['street'],
          phone: json['phone'],
          postalCode: json['postalCode'],
          imageUrl: json['imageUrl']);
    }
    return UserDataModel(
      id: '',
      name: '',
      email: '',
      password: '',
      memberSince: '',
    );
  }

  Map<String, dynamic> toJson() {
    final favorites = this
        .favorites
        .map((product) => (product as ProductDataModel).toJson())
        .toList();

    final cartProducts = this.cartProducts.map((productMap) {
      return (productMap['product'] as ProductDataModel).toJson();
    }).toList();
    final json = <String, dynamic>{
      'id': id,
      'email': email,
      'name': name,
      'password': password,
      'phone': phone,
      'governorate': governorate,
      'city': city,
      'street': street,
      'postalCode': postalCode,
      'imageUrl': imageUrl,
      'favorites': favorites,
      'cartProducts': cartProducts,
      'memberSince': memberSince,
    };

    return json;
  }
}
