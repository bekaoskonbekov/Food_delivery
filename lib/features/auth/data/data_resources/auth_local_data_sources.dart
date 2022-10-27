import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<void> casheUserId(String userId);
  getCasheUserId();
  Future<void> deleteUser();
}

class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  final SharedPreferences sharedPreferences;
  AuthLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> casheUserId(String userId) async {
    await sharedPreferences.setString('CASHED_USER_INFO', userId);
  }

  @override
  getCasheUserId() {
    final userId = sharedPreferences.getString('CASHED_USER_INFO');
    if (userId != null) {
      return userId;
    }
    return null;
  }

  @override
  deleteUser() async {
    await sharedPreferences.remove('CASHED_USER_INFO');
  }
}
