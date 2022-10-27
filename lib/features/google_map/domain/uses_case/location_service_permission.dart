import '../../services/repositiories/google_map_repo_impl.dart';

class LocationServicePermissionUseCase {
  final GoogleMapRepoImpl googleMapRepoImpl;

  LocationServicePermissionUseCase({required this.googleMapRepoImpl});
  Future<bool> call() async {
    return await googleMapRepoImpl.locationServicePermission();
  }
}
