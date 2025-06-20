import 'package:doctors/core/utils/assets.dart';
import 'package:doctors/data/models/doctor_register_model/Data.dart';
import 'package:flutter/material.dart';

class DoctorDetailsScreen extends StatelessWidget {
  final Data doctorsModel;

  const DoctorDetailsScreen({
    super.key,
    required this.doctorsModel,
  });

  @override
  Widget build(BuildContext context) {
    final fullName =
        "Dr. ${doctorsModel.firstName ?? ''} ${doctorsModel.lastName ?? ''}";

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      appBar: AppBar(
        title: const Text("Doctor Details"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          children: [
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.grey.shade200,
              child: ClipOval(
                child: Image.asset(
                  doctorsModel.gender?.toLowerCase() == "female"
                      ? Assets.assetsImagesFemaleDoctor
                      : Assets.assetsImagesMaleDoctor,
                  fit: BoxFit.fitWidth,
                  height: 180,
                  width: 180,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              fullName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 24),
            _buildInfoTile(Icons.email, "Email", doctorsModel.emailAddress),
            _buildInfoTile(Icons.phone, "Phone", doctorsModel.phoneNumber),
            _buildInfoTile(Icons.person, "Gender", doctorsModel.gender),
            _buildInfoTile(Icons.cake, "Birth Date", doctorsModel.birthDate),
            _buildInfoTile(Icons.medical_services, "Specialization",
                doctorsModel.specialization),
            _buildInfoTile(Icons.location_on, "Address", doctorsModel.address),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                // TODO: navigate to chat screen or open chat logic
              },
              icon: const Icon(Icons.chat_bubble_outline),
              label: const Text("Chat"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String label, String? value) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueGrey),
      title: Text(
        label,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        value ?? 'Not provided',
        overflow: TextOverflow.ellipsis,
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
    );
  }
}
