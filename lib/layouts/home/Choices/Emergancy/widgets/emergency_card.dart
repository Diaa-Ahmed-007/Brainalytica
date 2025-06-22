import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EmergencyCard extends StatelessWidget {
  final String contactName;
  final String address;
  final String contactPhone;
  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final String birthDate;
  final String phoneNumber;

  const EmergencyCard({
    super.key,
    required this.contactName,
    required this.address,
    required this.contactPhone,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.birthDate,
    required this.phoneNumber,
  });

  String formatDate(String date) {
    try {
      final parsedDate = DateTime.parse(date);
      return DateFormat('d MMM y').format(parsedDate);
    } catch (_) {
      return "Not available";
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isEmergencyAvailable = contactName.isNotEmpty || address.isNotEmpty || contactPhone.isNotEmpty;
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Emergency Section
            Row(
              children: [
                Icon(Icons.warning_amber_rounded, color: Colors.red[600], size: 26),
                const SizedBox(width: 7),
                Text(
                  "Emergency Contact",
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.red[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            isEmergencyAvailable
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Contact Name: ${contactName.isNotEmpty ? contactName : "Not available"}"),
                      Text("Contact Address: ${address.isNotEmpty ? address : "Not available"}"),
                      Text("Contact Phone: ${contactPhone.isNotEmpty ? contactPhone : "Not available"}"),
                    ],
                  )
                : Text(
                    "No emergency contact info.",
                    style: TextStyle(color: Colors.grey[600], fontStyle: FontStyle.italic),
                  ),
            const Divider(height: 28, thickness: 1.3),
            // Patient Info
            Row(
              children: [
                Icon(Icons.person_pin, color: Colors.blue[700], size: 24),
                const SizedBox(width: 7),
                Text(
                  "Patient Info",
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.blue[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Wrap(
              spacing: 8,
              runSpacing: 3,
              children: [
                _infoChip("Name", "$firstName $lastName"),
                _infoChip("Email", email),
                _infoChip("Gender", gender),
                _infoChip("DOB", formatDate(birthDate)),
                _infoChip("Phone", phoneNumber),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoChip(String label, String value) => Chip(
        label: Text(
          "$label: ${value.isNotEmpty ? value : "Not available"}",
          style: const TextStyle(fontSize: 14),
        ),
        backgroundColor: Colors.grey[100],
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
      );
}
