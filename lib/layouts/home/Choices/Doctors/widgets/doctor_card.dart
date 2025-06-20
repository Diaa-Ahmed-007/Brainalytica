import 'package:doctors/core/utils/assets.dart';
import 'package:doctors/data/models/doctor_register_model/Data.dart';
import 'package:doctors/layouts/home/Choices/Doctors/doctor_details_srceen.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key, required this.doctorsModel});
  final Data doctorsModel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    String imagePath = doctorsModel.gender?.toLowerCase() == "female"
        ? Assets.assetsImagesFemaleDoctor
        : Assets.assetsImagesMaleDoctor;

    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DoctorDetailsScreen(doctorsModel: doctorsModel),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 8,
              ),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
                child: Image.asset(
                  imagePath,
                  width: 100,
                  height: 130,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dr. ${doctorsModel.firstName} ${doctorsModel.lastName}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Specialization: ${doctorsModel.specialization}",
                        style: TextStyle(fontSize: 16, color: theme.hintColor),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Address: ${doctorsModel.address}",
                        style: TextStyle(fontSize: 16, color: theme.hintColor),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Phone: ${doctorsModel.phoneNumber}",
                        style: TextStyle(fontSize: 16, color: theme.hintColor),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
