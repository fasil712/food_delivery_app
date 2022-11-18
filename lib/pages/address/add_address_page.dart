import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/auth_controller.dart';
import 'package:food_delivery_app/controllers/location_controller.dart';
import 'package:food_delivery_app/controllers/user_controller.dart';
import 'package:food_delivery_app/models/address_model.dart';
import 'package:food_delivery_app/pages/address/pick_address_map.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:food_delivery_app/utilities/colors.dart';
import 'package:food_delivery_app/utilities/dimensions.dart';
import 'package:food_delivery_app/widgets/app_textfield.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({Key? key}) : super(key: key);

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _contactPersonName = TextEditingController();
  final TextEditingController _contactPersonNumber = TextEditingController();
  late bool _isLoggedIn;
  CameraPosition _cameraPosition =
      const CameraPosition(target: LatLng(45.51563, -122.677433), zoom: 17);
  late LatLng _initialPostion = LatLng(45.51563, -122.677433);

  @override
  void initState() {
    super.initState();
    _isLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (_isLoggedIn && Get.find<UserController>().userModel == null) {
      Get.find<UserController>().getUserInfo();
    }
    if (Get.find<LocationController>().addressList.isNotEmpty) {
      if (Get.find<LocationController>().getUserAddressFromLocalStorage() ==
          "") {
        Get.find<LocationController>()
            .saveUserAddress(Get.find<LocationController>().addressList.last);
      }
      Get.find<LocationController>().getUserAddress();
      _cameraPosition = CameraPosition(
          target: LatLng(
              double.parse(
                  Get.find<LocationController>().getAddress['latitude']),
              double.parse(
                  Get.find<LocationController>().getAddress['longtiude'])));
      _initialPostion = LatLng(
          double.parse(Get.find<LocationController>().getAddress['latitude']),
          double.parse(Get.find<LocationController>().getAddress['longtiude']));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Address Page")),
      backgroundColor: AppColors.mainColor,
      body: GetBuilder<UserController>(builder: (userController) {
        if (userController.userModel != null &&
            _contactPersonName.text.isEmpty) {
          _contactPersonName.text = userController.userModel.name;
          _contactPersonNumber.text = userController.userModel.phone;
          if (Get.find<LocationController>().addressList.isNotEmpty) {
            _addressController.text =
                Get.find<LocationController>().getUserAddress().address!;
          }
        }
        return GetBuilder<LocationController>(builder: (locationController) {
          _addressController.text = '${locationController.placemark.name ?? ''}'
              '${locationController.placemark.locality ?? ''}'
              '${locationController.placemark.postalCode ?? ''}'
              '${locationController.placemark.country ?? ''}';
          return SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                height: 140,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 2, color: AppColors.mainColor)),
                child: Stack(children: [
                  GoogleMap(
                      onTap: (argument) {
                        Get.toNamed(RouteHelper.getPickAddressPage(),
                            arguments: PickAddressMap(
                              fromSignup: false,
                              fromAddrss: true,
                              googleMapController:
                                  locationController.mapController,
                            ));
                      },
                      initialCameraPosition:
                          CameraPosition(target: _initialPostion, zoom: 17),
                      zoomControlsEnabled: false,
                      compassEnabled: false,
                      indoorViewEnabled: true,
                      mapToolbarEnabled: false,
                      myLocationEnabled: true,
                      onCameraIdle: () {
                        locationController.updatePosition(
                            _cameraPosition, true);
                      },
                      onCameraMove: ((position) => _cameraPosition = position),
                      onMapCreated: (GoogleMapController controller) {
                        locationController.setMapController(controller);
                        if (Get.find<LocationController>()
                            .addressList
                            .isEmpty) {}
                      }),
                ]),
              ),
              SizedBox(
                height: 50,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: locationController.addressTypeList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          locationController.setAddressTypeIndex(index);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: Dimensions.width20,
                              top: Dimensions.height20),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.width20,
                                vertical: Dimensions.height10),
                            margin: EdgeInsets.only(right: Dimensions.width10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    Dimensions.radius20 / 4),
                                color: Theme.of(context).cardColor,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey[200]!,
                                      spreadRadius: 1,
                                      blurRadius: 5)
                                ]),
                            child: Icon(
                              index == 0
                                  ? Icons.home_filled
                                  : index == 1
                                      ? Icons.work
                                      : Icons.map,
                              color:
                                  locationController.adderssTypeIndex == index
                                      ? AppColors.mainColor
                                      : Theme.of(context).disabledColor,
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(height: Dimensions.height20),
              Padding(
                padding: EdgeInsets.only(left: Dimensions.width20),
                child: BigText(text: "Delivery Address"),
              ),
              SizedBox(height: Dimensions.height10),
              AppTextField(
                  textConroller: _addressController,
                  hintText: "Your address",
                  icon: Icons.map),
              SizedBox(height: Dimensions.height20),
              Padding(
                padding: EdgeInsets.only(left: Dimensions.width20),
                child: BigText(text: "Contact Name"),
              ),
              SizedBox(height: Dimensions.height10),
              AppTextField(
                  textConroller: _contactPersonName,
                  hintText: "Your name",
                  icon: Icons.person),
              SizedBox(height: Dimensions.height20),
              Padding(
                padding: EdgeInsets.only(left: Dimensions.width20),
                child: BigText(text: "Contact Number"),
              ),
              SizedBox(height: Dimensions.height10),
              AppTextField(
                  textConroller: _contactPersonNumber,
                  hintText: "Your phone",
                  icon: Icons.phone),
            ]),
          );
        });
      }),
      bottomNavigationBar:
          GetBuilder<LocationController>(builder: (locationController) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: Dimensions.height20 * 8,
              decoration: BoxDecoration(
                  color: AppColors.buttonBackgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20 * 2),
                      topRight: Radius.circular(Dimensions.radius20 * 2))),
              padding: EdgeInsets.only(
                  top: Dimensions.height30,
                  bottom: Dimensions.height30,
                  left: Dimensions.width20,
                  right: Dimensions.width20),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                GestureDetector(
                  onTap: () {
                    AddressModel addressModel = AddressModel(
                      addressType: locationController
                          .addressTypeList[locationController.adderssTypeIndex],
                      contactPersonName: _contactPersonName.text,
                      contactPersonNumber: _contactPersonNumber.text,
                      address: _addressController.text,
                      latitude: locationController.position.latitude.toString(),
                      longitude:
                          locationController.position.longitude.toString(),
                    );
                    locationController
                        .addAddress(addressModel)
                        .then((response) {
                      if (response.isSuccess) {
                        Get.back();
                        Get.snackbar("Address", "Added successfully");
                      } else {
                        Get.snackbar("Address", "Couldn't save address");
                      }
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.height20,
                        bottom: Dimensions.height20,
                        left: Dimensions.width20,
                        right: Dimensions.width20),
                    decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20)),
                    child: BigText(
                      text: "Save Address",
                      color: Colors.white,
                      size: 26,
                    ),
                  ),
                )
              ]),
            ),
          ],
        );
      }),
    );
  }
}
