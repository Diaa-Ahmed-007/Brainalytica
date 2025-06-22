import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PatientCard extends StatelessWidget {
  final String result;
  final double? probability;
  final String createdAt;
  final String firstName;
  final String lastName;
  final String email;
  final String birthDate;
  final String phoneNumber;
  final int? age;
  final String? gender;
  final String? hypertension;
  final String? heartDisease;
  final String? workType;
  final String? residenceType;
  final double? avgGlucoseLevel;
  final double? bmi;
  final String? smokingStatus;

  const PatientCard({
    super.key,
    required this.result,
    required this.probability,
    required this.createdAt,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.birthDate,
    required this.phoneNumber,
    this.age,
    this.gender,
    this.hypertension,
    this.heartDisease,
    this.workType,
    this.residenceType,
    this.avgGlucoseLevel,
    this.bmi,
    this.smokingStatus,
  });

  String formatDate(String date) {
    try {
      final parsedDate = DateTime.parse(date);
      return DateFormat('d MMMM y, h:mm a').format(parsedDate);
    } catch (_) {
      return date;
    }
  }

  @override
  Widget build(BuildContext context) {
    Color statusColor = result == "Stroke" ? Colors.red : Colors.green;
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.health_and_safety, color: statusColor),
                const SizedBox(width: 8),
                Text(
                  result,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: statusColor,
                  ),
                ),
                const Spacer(),
                if (probability != null)
                  Text(
                    "Probability: ${(probability! * 100).toStringAsFixed(1)}%",
                    style: TextStyle(
                      fontSize: 14,
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              "Created: ${formatDate(createdAt)}",
              style: TextStyle(color: Colors.grey[600]),
            ),
            const Divider(height: 20, thickness: 1.2),
            Row(
              children: [
                const Icon(Icons.person, color: Colors.blue),
                const SizedBox(width: 8),
                Text(
                  '$firstName $lastName',
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold),
                ),
                if (gender != null)
                  Text(
                    "  ($gender)",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[700]),
                  ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.cake, color: Colors.purple),
                const SizedBox(width: 8),
                Text("Birth: ${formatDate(birthDate)}"
                    "  Age: ${age ?? 'N/A'}"),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.email, color: Colors.teal),
                const SizedBox(width: 8),
                Text(email),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.phone, color: Colors.green),
                const SizedBox(width: 8),
                Text(phoneNumber),
              ],
            ),
            const Divider(height: 18),
            Wrap(
              spacing: 10,
              runSpacing: 6,
              children: [
                if (hypertension != null)
                  _chip("Hypertension: $hypertension"),
                if (heartDisease != null)
                  _chip("Heart disease: $heartDisease"),
                if (workType != null)
                  _chip("Work: $workType"),
                if (residenceType != null)
                  _chip("Residence: $residenceType"),
                if (avgGlucoseLevel != null)
                  _chip("Glucose: $avgGlucoseLevel"),
                if (bmi != null) _chip("BMI: $bmi"),
                if (smokingStatus != null)
                  _chip("Smoking: $smokingStatus"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _chip(String text) => Chip(
        label: Text(text, style: const TextStyle(fontSize: 13)),
        backgroundColor: Colors.grey[200],
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
      );
}
