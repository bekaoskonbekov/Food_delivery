import 'package:dartz/dartz.dart';

import '../../data/data_resources/auth_local_data_sources.dart';
import '../../data/data_resources/auth_remote_data_sources.dart';

class SignOutUseCase {
  final AuthLocalDataSourceImpl authLocalDataSource;
  final AuthRemoteDataSourcesImpl authRemoteDataSource;

  SignOutUseCase(
      {required this.authLocalDataSource, required this.authRemoteDataSource});
  Future<Unit> call() async {
    await authLocalDataSource.deleteUser();
    return authRemoteDataSource.signOut();
  }
}
