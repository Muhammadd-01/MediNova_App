// doctor_profile.dart
import 'package:flutter/material.dart';

class DoctorProfile extends StatelessWidget {
  final String name;
  final String specialization;
  final String availability;
  final String phone;
  final String imageUrl;

  const DoctorProfile({
    super.key,
    required this.name,
    required this.specialization,
    required this.availability,
    required this.phone,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
              radius: 48,
            ),
            SizedBox(height: 12),
            Text(name, style: Theme.of(context).textTheme.headline6),
            Text(specialization),
            SizedBox(height: 8),
            Text('Available: $availability'),
            Text('Phone: $phone'),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {},
              child: Text('Book Appointment'),
            ),
          ],
        ),
      ),
    );
  }
}
