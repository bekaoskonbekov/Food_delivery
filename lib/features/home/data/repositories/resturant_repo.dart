import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/repositories/resturant_repo.dart';
import '../data_sources/remote_resturants_data_source.dart';
import '../models/resturant_model.dart';

class ResturantRepoImpl extends ResturantRepo {
  final RemoteResturantDataSourceImpl remoteResturantDataSourceImpl;

  ResturantRepoImpl({required this.remoteResturantDataSourceImpl});
  @override
  Future<Either<Failures, List<ResturantDataModel>>> getAllResturant() async {
    try {
      final data = await remoteResturantDataSourceImpl.getAllResturant();
      final resturantData =
          data.map((e) => ResturantDataModel.fromJson(e)).toList();
      resturantData.shuffle();

      return Right(resturantData);
    } catch (e) {
      return Left(Failures(message: e.toString()));
    }
  }
}
