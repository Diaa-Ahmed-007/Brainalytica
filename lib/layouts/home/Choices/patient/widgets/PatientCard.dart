import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PatientCard extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String email;
  final String birthDate;
  final String phoneNumber;
  final String pharmaceutical;
  final String chronicDiseases;
  final String strokeInjuryDate;

  const PatientCard({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.birthDate,
    required this.phoneNumber,
    required this.pharmaceutical,
    required this.chronicDiseases,
    required this.strokeInjuryDate,
  });

  String formatDate(String date) {
    try {
      final parsedDate = DateTime.parse(date);
      return DateFormat('d MMMM y').format(parsedDate);
    } catch (_) {
      return date;
    }
  }

  @override
  Widget build(BuildContext context) {
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
                const Icon(Icons.person, color: Colors.blue),
                const SizedBox(width: 8),
                Text(
                  '$firstName $lastName',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.email, color: Colors.teal),
                const SizedBox(width: 8),
                Text(email),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.cake, color: Colors.purple),
                const SizedBox(width: 8),
                Text(formatDate(birthDate)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.phone, color: Colors.green),
                const SizedBox(width: 8),
                Text(phoneNumber),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.medication, color: Colors.redAccent),
                const SizedBox(width: 8),
                Expanded(child: Text(pharmaceutical)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.local_hospital, color: Colors.orange),
                const SizedBox(width: 8),
                Expanded(child: Text(chronicDiseases)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.event, color: Colors.indigo),
                const SizedBox(width: 8),
                Text("Stroke Injury: ${formatDate(strokeInjuryDate)}"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
