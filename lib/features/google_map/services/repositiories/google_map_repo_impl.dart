import 'package:geolocator/geolocator.dart';

import '../../domain/repository/google_map_repo.dart';

class GoogleMapRepoImpl extends GoogleMapRepo {
  @override
  Future<bool> isLocationServiceEnabled() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    try {
      if (!serviceEnabled) {
        return false;
      }
      return serviceEnabled;
    } catch (e) {
      return Future.error('Location Services are disabled');
    }
  }

  @override
  Future<bool> locationServicePermission() async {
    LocationPermission permission;
    try {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return false;
        }
      }
      if (permission == LocationPermission.deniedForever) {
        return false;
      }
      return true;
    } catch (e) {
      return Future.error('Location permission denied');
    }
  }

  @override
  Future<Position> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  }
}
