import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/location_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PickAddressMap extends StatefulWidget {
  final bool fromSignup;
  final bool fromAddrss;
  final GoogleMapController? googleMapController;
  const PickAddressMap(
      {Key? key,
      required this.fromSignup,
      required this.fromAddrss,
      this.googleMapController})
      : super(key: key);

  @override
  State<PickAddressMap> createState() => _PickAddressMapState();
}

class _PickAddressMapState extends State<PickAddressMap> {
  late LatLng _initialPostion;
  late GoogleMapController _mapController;
  late CameraPosition _cameraPosition;

  @override
  void initState() {
    super.initState();
    if (Get.find<LocationController>().addressList.isEmpty) {
      _initialPostion = LatLng(45.52156, -122.677433);
      _cameraPosition = CameraPosition(target: _initialPostion, zoom: 17);
    } else {
      if (Get.find<LocationController>().addressList.isNotEmpty) {
        _initialPostion = LatLng(
            double.parse(Get.find<LocationController>().getAddress['latitude']),
            double.parse(
                Get.find<LocationController>().getAddress['longitude']));
        _cameraPosition = CameraPosition(target: _initialPostion, zoom: 17);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: double.maxFinite,
            child: Stack(children: [
              GoogleMap(
                initialCameraPosition:
                    CameraPosition(target: _initialPostion, zoom: 17),
                zoomControlsEnabled: false,
                onCameraMove: ((position) {
                  _cameraPosition = position;
                }),
                onCameraIdle: () {
                  Get.find<LocationController>()
                      .updatePosition(_cameraPosition, false);
                },
              )
            ]),
          ),
        ),
      ),
    );
  }
}
