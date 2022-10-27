import '../../services/repositiories/google_map_repo_impl.dart';

class IsLocationServiceEnabledUseCase {
  final GoogleMapRepoImpl googleMapRepoImpl;

  IsLocationServiceEnabledUseCase({required this.googleMapRepoImpl});
  Future<bool> call() async {
    return await googleMapRepoImpl.isLocationServiceEnabled();
  }
}
