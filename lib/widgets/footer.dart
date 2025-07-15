// footer.dart
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final bool isDarkMode;

  const Footer({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isDarkMode ? Colors.grey[850] : Colors.grey[200],
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: Column(
        children: [
          const Text(
            'MediNova is your trusted source for medical info, consultations, and health services.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 20,
            runSpacing: 10,
            alignment: WrapAlignment.center,
            children: [
              TextButton(onPressed: () {}, child: const Text('Home')),
              TextButton(onPressed: () {}, child: const Text('About Us')),
              TextButton(onPressed: () {}, child: const Text('Articles')),
              TextButton(onPressed: () {}, child: const Text('News')),
              TextButton(onPressed: () {}, child: const Text('Medicine Suggestion')),
              TextButton(onPressed: () {}, child: const Text('Consultation')),
              TextButton(onPressed: () {}, child: const Text('Feedback')),
              TextButton(onPressed: () {}, child: const Text('Emergency Services')),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'Contact us: info@MediNova.com | (123) 456-7890',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 8),
          const Text('123 Medical Street, Health City, HC 12345'),
          const SizedBox(height: 16),
          const Text('© 2023 MediNova. All rights reserved.'),
        ],
      ),
    );
  }
}
