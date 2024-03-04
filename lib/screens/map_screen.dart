import 'dart:async';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parkie/colors.dart';
import 'package:parkie/widget/parking_slots.dart';

class MapScreen extends StatefulWidget {
  static const String id = 'map_screen';
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const LatLng _myLocation =
      LatLng(34.013617510467725, 71.53592481428856);
  final bool _showPopup = false;
  final Completer<GoogleMapController> controller = Completer();

  Future<void> _loadMapData() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkTheme,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: greenButton,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 50),
              child: Text(
                "Parking map",
                style: TextStyle(
                  fontFamily: 'Anta-Regular.ttf',
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                // parkingController.timeCounter();
                Get.toNamed("/about-us");
              },
              icon: const Icon(
                Icons.person,
                color: Colors.white,
                size: 30,
              )),
        ],
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: _loadMapData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: greenButton,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Connection not found ${snapshot.error}'));
          } else {
            return Stack(
              children: [
                GoogleMap(
                  buildingsEnabled: true,
                  compassEnabled: true,
                  mapType: MapType.hybrid,
                  initialCameraPosition: const CameraPosition(
                    target: _myLocation,
                    zoom: 13.0,
                  ),
                  markers: {
                    Marker(
                        visible: true,
                        onTap: () {
                          Get.to(const ParkingSlots());
                        },
                        markerId: const MarkerId('parking1'),
                        position:
                            const LatLng(33.990314558494, 71.52043547393964),
                        infoWindow: const InfoWindow(title: 'Parking lot')),
                    Marker(
                        visible: true,
                        onTap: () {
                          Get.to(const ParkingSlots());
                        },
                        markerId: const MarkerId('parking2'),
                        position:
                            const LatLng(34.01024785854715, 71.5741950202755),
                        infoWindow: const InfoWindow(
                            title: 'Chowk Yadgar Underground Car Park')),
                    Marker(
                      visible: true,
                      onTap: () {
                        Get.to(const ParkingSlots());
                      },
                      markerId: const MarkerId('parking3'),
                      position:
                          const LatLng(33.991761188148224, 71.53361185758641),
                      infoWindow: const InfoWindow(
                        title: 'Valet Parking lot',
                      ),
                    ),
                    Marker(
                        visible: true,
                        onTap: () {
                          Get.to(const ParkingSlots());
                        },
                        markerId: const MarkerId('parking4'),
                        position:
                            const LatLng(34.00360078771323, 71.53873082183773),
                        infoWindow:
                            const InfoWindow(title: 'Private Car Park')),
                    Marker(
                        visible: true,
                        onTap: () {
                          Get.to(const ParkingSlots());
                        },
                        markerId: const MarkerId('parking5'),
                        position:
                            const LatLng(33.976730407124585, 71.44224643163928),
                        infoWindow:
                            const InfoWindow(title: 'Alfatah car parking')),
                    Marker(
                        visible: true,
                        onTap: () {
                          Get.to(const ParkingSlots());
                        },
                        markerId: const MarkerId('parking6'),
                        position:
                            const LatLng(33.984399313219434, 71.44376992907003),
                        infoWindow:
                            const InfoWindow(title: 'Tatara park parking')),
                  },
                  onMapCreated: (GoogleMapController controller) {},
                ),
                if (_showPopup)
                  Positioned(
                    top: 100,
                    left: 20,
                    child: Container(
                      width: 200,
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                      ),
                    ),
                  )
              ],
            );
          }
        },
      ),
    );
  }
}
