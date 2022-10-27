import 'package:geolocator/geolocator.dart';

import '../../services/repositiories/google_map_repo_impl.dart';

class GetCurrentLocationUseCase {
  final GoogleMapRepoImpl googleMapRepoImpl;

  GetCurrentLocationUseCase({required this.googleMapRepoImpl});
  Future<Position> call() async {
    return await googleMapRepoImpl.getCurrentLocation();
  }
}
