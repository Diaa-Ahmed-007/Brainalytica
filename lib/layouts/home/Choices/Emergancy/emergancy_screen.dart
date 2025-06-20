import 'dart:developer';

import 'package:doctors/core/reusable_componants/custom_text_field.dart';
import 'package:doctors/core/utils/assets.dart';
import 'package:doctors/data/models/patient_login_model/patient_login_model.dart';
import 'package:doctors/layouts/home/Choices/Emergancy/view_model/add_emergancy_view_model.dart';
import 'package:doctors/layouts/home/Choices/Emergancy/view_model/add_emergancy_view_model_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class EmergancyScreen extends StatefulWidget {
  const EmergancyScreen({super.key});

  @override
  State<EmergancyScreen> createState() => _EmergancyScreenState();
}

class _EmergancyScreenState extends State<EmergancyScreen> {
  late TextEditingController nameController;
  late TextEditingController addressController;
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    addressController = TextEditingController();
    phoneController = TextEditingController();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.always &&
          permission != LocationPermission.whileInUse) return;
    }

    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    try {
      // دي السطر الجديد اللي بيحول الإحداثيات لعنوان
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      final place = placemarks.first;

      setState(() {
        addressController.text =
            '${place.street}, ${place.subLocality}, ${place.locality}, ${place.administrativeArea}, ${place.country}';
        log('Address: ${addressController.text}'); // Log the address
      });
    } catch (e) {
      setState(() {
        addressController.text = '${position.latitude}, ${position.longitude}';
        log('Address: ${addressController.text}');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final PatientLoginModel patient =
        ModalRoute.of(context)?.settings.arguments as PatientLoginModel;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BlocListener<AddEmergancyViewModel, AddEmergancyViewModelState>(
      listener: (context, state) {
        if (state is AddEmergancyViewModelLoadingState) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
        } else {
          Navigator.pop(context);
        }

        if (state is AddEmergancyViewModelSuccessState) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Success"),
              content: const Text("Patient data added successfully."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Text("OK"),
                ),
              ],
            ),
          );
        } else if (state is AddEmergancyViewModelErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Error: ${state.errorMessage}")),
          );
        }
      },
      child: Scaffold(
        body: Stack(
          alignment: Alignment.topLeft,
          children: [
            Image.asset(
              Assets.assetsImagesEmergancyBackground,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.04, left: width * 0.03),
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 3),
                  CustomTextField(
                    hintText: "Name",
                    keyboard: TextInputType.name,
                    textController: nameController,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    hintText: "Address (auto-filled)",
                    keyboard: TextInputType.text,
                    textController: addressController,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    hintText: "Phone Number",
                    keyboard: TextInputType.number,
                    textController: phoneController,
                    validator: (value) {
                      if (value!.isEmpty) return "This field can't be empty";
                      if (value.length != 11)
                        return "Phone number must be 11 digits";
                      return null;
                    },
                  ),
                  const Spacer(flex: 2),
                  InkWell(
                    onTap: () {
                      context.read<AddEmergancyViewModel>().addEmergancy(
                            name: nameController.text,
                            address: addressController.text,
                            phoneNumber: phoneController.text,
                            patientId: patient.user?.patientId?.toInt() ?? 0,
                          );
                    },
                    child: Container(
                      height: height * 0.1,
                      width: width * 0.4,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimary,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(Icons.check,
                            color: Theme.of(context).colorScheme.primary,
                            size: 50),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
