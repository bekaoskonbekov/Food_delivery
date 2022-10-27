import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../domain/uses_case/get_current_location.dart';
import '../../../domain/uses_case/location_service_enable.dart';
import '../../../domain/uses_case/location_service_permission.dart';

part 'google_map_state.dart';

class GoogleMapCubit extends Cubit<GoogleMapState> {
  final GetCurrentLocationUseCase getCurrentLocationUseCase;
  final IsLocationServiceEnabledUseCase isLocationServiceEnabledUseCase;
  final LocationServicePermissionUseCase locationServicePermissionUseCase;
  GoogleMapCubit({
    required this.getCurrentLocationUseCase,
    required this.isLocationServiceEnabledUseCase,
    required this.locationServicePermissionUseCase,
  }) : super(GoogleMapState());

  Future isLocationEnabled() async {
    bool isLocationEnable = await isLocationServiceEnabledUseCase();
    if (!isLocationEnable) {
      emit(state.copyWith(serviceStatus: LocationServiceStatus.disabled));
    } else {
      emit(state.copyWith(serviceStatus: LocationServiceStatus.enabled));
    }
  }

  Future locationServicePermission() async {
    bool servicePermission = await locationServicePermissionUseCase();
    if (!servicePermission) {
      emit(state.copyWith(permissionStatus: PermissionStatus.denied));
    } else {
      emit(state.copyWith(permissionStatus: PermissionStatus.allowed));
    }
  }

  Future<Position> getCurrentLocation() async {
    await locationServicePermission();
    final Position position = await getCurrentLocationUseCase();
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    String address = placemarks.reversed.last.country.toString() +
        " " +
        placemarks.reversed.last.locality.toString() +
        " " +
        placemarks.reversed.last.street.toString() +
        " " +
        placemarks.reversed.last.name.toString();
    Set<Marker> mark = {
      Marker(
          markerId: MarkerId('current-location'),
          infoWindow: InfoWindow(title: address),
          position: LatLng(position.latitude, position.longitude))
    };
    emit(state.copyWith(markers: mark));
    return position;
  }
}
