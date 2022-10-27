import 'package:cloud_firestore/cloud_firestore.dart';

abstract class RemoteProductsDataSources {
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getCategories();
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getPopularProducts();
}

class ProductsRemoteDataSourcesImpl implements RemoteProductsDataSources {
  ProductsRemoteDataSourcesImpl._();
  static final ProductsRemoteDataSourcesImpl instance =
      ProductsRemoteDataSourcesImpl._();
  final firebase = FirebaseFirestore.instance;

  @override
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getCategories() async {
    final categories = await firebase.collection('categories').get();
    return categories.docs;
  }

  @override
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getPopularProducts() async {
    final popularProducts =
        await firebase.collection('products').limit(6).get();
    return popularProducts.docs;
  }
}
