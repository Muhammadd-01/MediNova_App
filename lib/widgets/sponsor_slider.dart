// sponsor_slider.dart
import 'package:flutter/material.dart';

class SponsorSlider extends StatelessWidget {
  const SponsorSlider({super.key});

  final List<Map<String, String>> sponsors = const [
    {'name': 'PharmaCorp', 'logo': 'assets/sponsor-logos/pharmacorp.png'},
    {'name': 'MediTech', 'logo': 'assets/sponsor-logos/meditech.png'},
    {'name': 'HealthPlus', 'logo': 'assets/sponsor-logos/healthplus.png'},
    {'name': 'BioLife', 'logo': 'assets/sponsor-logos/biolife.png'},
    {'name': 'CureAll', 'logo': 'assets/sponsor-logos/cureall.png'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      color: isDark ? Colors.grey[900] : Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Our Sponsors',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 80,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: sponsors.length,
              separatorBuilder: (context, index) => const SizedBox(width: 24),
              itemBuilder: (context, index) {
                final sponsor = sponsors[index];
                return Image.asset(
                  sponsor['logo']!,
                  height: 60,
                  fit: BoxFit.contain,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
