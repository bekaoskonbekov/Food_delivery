part of 'google_map_cubit.dart';

enum LocationServiceStatus {
  pending,
  disabled,
  enabled,
}

enum PermissionStatus {
  pending,
  allowed,
  denied,
}

class GoogleMapState extends Equatable {
   GoogleMapState({
    this.serviceStatus = LocationServiceStatus.pending,
    this.permissionStatus = PermissionStatus.pending,
    this.markers = const {},

    this.initialPosition =
        const CameraPosition(target: LatLng(30.033333, 31.233334), zoom: 14),
  });
   Set<Marker> markers;
  final CameraPosition initialPosition;
  final LocationServiceStatus serviceStatus;
  final PermissionStatus permissionStatus;

  GoogleMapState copyWith({
    Set<Marker>? markers,
    LocationServiceStatus? serviceStatus,
    PermissionStatus? permissionStatus,

  }) {
    return GoogleMapState(
      markers: markers ?? this.markers,
      serviceStatus: serviceStatus ?? this.serviceStatus,
      permissionStatus: permissionStatus ?? this.permissionStatus,
    );
  }
  @override
  List<Object> get props => [
        markers,
        initialPosition,
        serviceStatus,
        permissionStatus,
      ];
}
