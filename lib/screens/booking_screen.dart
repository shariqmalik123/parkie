// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkie/colors.dart';
import 'package:parkie/controller/PakingController.dart';

class BookingScreen extends StatelessWidget {
  final String slotName;
  final String slotId;
  const BookingScreen(
      {super.key, required this.slotId, required this.slotName});

  @override
  Widget build(BuildContext context) {
    ParkingController parkingController = Get.put(ParkingController());
    return Scaffold(
      backgroundColor: darkTheme,
      appBar: AppBar(
        backgroundColor: greenButton,
        title: const Text(
          "BOOK SLOT",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Anta-Regular.ttf',
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/Car5.png',
                    width: 300,
                    height: 200,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Text(
                    "Book Now 😊",
                    style: TextStyle(
                      color: whiteButton,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              const Divider(
                thickness: 1,
                color: greenButton,
              ),
              const SizedBox(height: 30),
              const Row(
                children: [
                  Text(
                    "Enter your name ",
                    style: TextStyle(
                      color: whiteButton,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: parkingController.name,
                      decoration: const InputDecoration(
                          fillColor: Color.fromARGB(255, 211, 210, 210),
                          filled: true,
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.person,
                            color: greenButton,
                          ),
                          hintText: "Your name here",
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              const Row(
                children: [
                  Text(
                    "Enter Vehical Number ",
                    style: TextStyle(
                      color: whiteButton,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: parkingController.vehicalNumber,
                      decoration: const InputDecoration(
                          fillColor: Color.fromARGB(255, 211, 210, 210),
                          filled: true,
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.car_rental,
                            color: greenButton,
                          ),
                          hintText: "EX: 4567",
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Text(
                    "Choose Slot Time (in Minuits)",
                    style: TextStyle(
                      color: whiteButton,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Obx(
                () => Slider(
                  mouseCursor: MouseCursor.defer,
                  thumbColor: greenButton,
                  activeColor: greenButton,
                  inactiveColor: whiteButton,
                  label: "${parkingController.parkingTimeInMin.value} min",
                  value: parkingController.parkingTimeInMin.value,
                  onChanged: (v) {
                    parkingController.parkingTimeInMin.value = v;
                    if (v <= 30) {
                      parkingController.parkingAmount.value = 50;
                    } else {
                      parkingController.parkingAmount.value = 100;
                    }
                    //  parkingController.parkingAmount.value = (parkingController.parkingTimeInMin.value * 10).round();
                  },
                  divisions: 5,
                  min: 10,
                  max: 60,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "10",
                      style: TextStyle(
                        color: whiteButton,
                      ),
                    ),
                    Text(
                      "20",
                      style: TextStyle(
                        color: whiteButton,
                      ),
                    ),
                    Text(
                      "30",
                      style: TextStyle(
                        color: whiteButton,
                      ),
                    ),
                    Text(
                      "40",
                      style: TextStyle(
                        color: whiteButton,
                      ),
                    ),
                    Text(
                      "50",
                      style: TextStyle(
                        color: whiteButton,
                      ),
                    ),
                    Text(
                      "60",
                      style: TextStyle(
                        color: whiteButton,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your Slot Name",
                    style: TextStyle(
                      color: whiteButton,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    height: 80,
                    decoration: BoxDecoration(
                      color: greenButton,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        slotName,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Row(
                        children: [
                          Text(
                            "Amount to Be Pay",
                            style: TextStyle(
                              color: whiteButton,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          const Text(
                            'Rs.',
                            style: TextStyle(
                              fontSize: 30,
                              color: greenButton,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Obx(
                            () => Text(
                              "${parkingController.parkingAmount.value}",
                              style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w700,
                                color: greenButton,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      parkingController.bookParkingSlot(slotId);
                      print('is pressed');
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 20),
                      decoration: BoxDecoration(
                        color: greenButton,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        "PAY NOW",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
