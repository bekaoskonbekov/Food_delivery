import 'package:cloud_firestore/cloud_firestore.dart';

abstract class UserRemoteDataSources {
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData(String userId);
  Future<void> updateUserImage(
      {required String imageUrl, required String userId});
  Future<void> addToCart(
      {required Map<String, dynamic> product, required String userId});
}

class UserRemoteDataSourcesImpl extends UserRemoteDataSources {
  UserRemoteDataSourcesImpl._();
  static final UserRemoteDataSourcesImpl instance =
      UserRemoteDataSourcesImpl._();
  @override
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData(
      String userId) async {
    final userData =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    return userData;
  }

  @override
  Future<void> updateUserImage(
      {required String imageUrl, required String userId}) async {
    await FirebaseFirestore.instance.collection('users').doc(userId).update(
      {'imageUrl': imageUrl},
    );
  }
@override
  Future<void> addToCart(
      {required Map<String, dynamic> product, required String userId}) async {
    await FirebaseFirestore.instance.collection('users').doc(userId).update({
      'cartProducts': FieldValue.arrayUnion(
        [product],
      ),
    });
  }
}
