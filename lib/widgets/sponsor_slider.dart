// sponsor_slider.dart
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

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
    return Container(
      color: Theme.of(context).brightness == Brightness.dark
          ? Colors.grey[900]
          : Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Our Sponsors',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 80,
            child: Marquee(
              textDirection: TextDirection.ltr,
              velocity: 30,
              blankSpace: 100,
              pauseAfterRound: const Duration(seconds: 0),
              scrollAxis: Axis.horizontal,
              startPadding: 10,
              accelerationDuration: const Duration(seconds: 1),
              decelerationDuration: const Duration(milliseconds: 500),
              fadingEdgeStartFraction: 0.05,
              fadingEdgeEndFraction: 0.05,
              child: Row(
                children: [
                  for (var sponsor in sponsors)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Image.asset(
                        sponsor['logo']!,
                        height: 60,
                        fit: BoxFit.contain,
                      ),
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
