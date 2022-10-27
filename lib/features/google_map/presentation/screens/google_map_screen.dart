import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/injection_container.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_buttons.dart';
import '../../../../core/widgets/custom_searchbar_field.dart';
import '../blocs/cubit/google_map_cubit.dart';

class GoogleMapScreen extends StatelessWidget {
  GoogleMapScreen({Key? key}) : super(key: key);
  late GoogleMapController googleMapController;
  // Completer<GoogleMapController> googleMapController = Completer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(
              title: 'ChangeAddress',
              back: true,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
            ),
            Expanded(
              flex: 3,
              child: BlocBuilder<GoogleMapCubit, GoogleMapState>(
                buildWhen: ((previous, current) {
                  return previous.markers != current.markers ||
                      previous.serviceStatus != current.serviceStatus ||
                      previous.permissionStatus != current.permissionStatus;
                }),
                builder: (context, state) {
                  if (state.serviceStatus == LocationServiceStatus.disabled ||
                      state.serviceStatus == LocationServiceStatus.pending) {
                    return Center(
                      child: Text('Enable location service'),
                    );
                  } else {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height / 1.8,
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        children: [
                          GoogleMap(
                            initialCameraPosition: state.initialPosition,
                            markers: state.markers,
                            zoomControlsEnabled: false,
                            mapType: MapType.normal,
                            onMapCreated: (controller) =>
                                googleMapController = controller,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: IconButton(
                                onPressed: () async {
                                  context
                                      .read<GoogleMapCubit>()
                                      .getCurrentLocation()
                                      .then(
                                        (position) =>
                                            googleMapController.animateCamera(
                                          CameraUpdate.newCameraPosition(
                                            CameraPosition(
                                              target: LatLng(position.latitude,
                                                  position.longitude),
                                              zoom: 18,
                                            ),
                                          ),
                                        ),
                                      );
                                },
                                icon: Icon(
                                  Icons.location_pin,
                                  size: 30,
                                  color: mainColor,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      const CustomSearchBarField(),
                      Text('Your Address'),
                      FilledButton(
                        text: 'Save Address',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
