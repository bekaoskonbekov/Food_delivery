import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';

abstract class GoogleMapRepo {
  Future<bool> isLocationServiceEnabled();
  Future<bool> locationServicePermission();
  Future<Position> getCurrentLocation();
}
