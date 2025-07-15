import 'package:flutter/material.dart';

class HorizontalSponsorSlider extends StatelessWidget {
  const HorizontalSponsorSlider({super.key});

  final List<Map<String, String>> sponsors = const [
    {'name': 'PharmaCorp', 'logo': 'https://via.placeholder.com/100x50?text=PharmaCorp'},
    {'name': 'MediTech', 'logo': 'https://via.placeholder.com/100x50?text=MediTech'},
    {'name': 'HealthPlus', 'logo': 'https://via.placeholder.com/100x50?text=HealthPlus'},
    {'name': 'BioLife', 'logo': 'https://via.placeholder.com/100x50?text=BioLife'},
    {'name': 'CureAll', 'logo': 'https://via.placeholder.com/100x50?text=CureAll'},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: sponsors.length,
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          return Image.network(
            sponsors[index]['logo']!,
            height: 60,
            fit: BoxFit.contain,
          );
        },
      ),
    );
  }
}