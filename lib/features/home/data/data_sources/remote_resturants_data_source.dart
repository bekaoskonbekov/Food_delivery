import 'package:dio/dio.dart';

abstract class RemoteResturantDataSource {
  Future<List<dynamic>> getAllResturant();
}

class RemoteResturantDataSourceImpl extends RemoteResturantDataSource {
  late Dio dio;

  RemoteResturantDataSourceImpl() {
    BaseOptions options = BaseOptions(
      baseUrl: 'https://foodbukka.herokuapp.com/api/v1/',
      receiveTimeout: 20 * 1000, // 20 seconds
      connectTimeout: 20 * 1000,
    );
    dio = Dio(options);
  }

  @override
  Future<List<dynamic>> getAllResturant() async {
    Response response = await dio.get('restaurant');
    return response.data['Result'];
  }
}
