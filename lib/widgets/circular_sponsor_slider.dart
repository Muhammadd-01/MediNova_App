import 'dart:async';
import 'package:flutter/material.dart';

class CircularSponsorSlider extends StatefulWidget {
  const CircularSponsorSlider({super.key});

  @override
  State<CircularSponsorSlider> createState() => _CircularSponsorSliderState();
}

class _CircularSponsorSliderState extends State<CircularSponsorSlider> {
  final List<Map<String, String>> sponsors = [
    {
      'name': 'Johnson & Johnson',
      'logo': 'https://www.example.com/jnj-logo.png',
    },
    {
      'name': 'Pfizer',
      'logo': 'https://www.example.com/pfizer-logo.png',
    },
    {
      'name': 'Novartis',
      'logo': 'https://www.example.com/novartis-logo.png',
    },
    {
      'name': 'Roche',
      'logo': 'https://www.example.com/roche-logo.png',
    },
    {
      'name': 'Merck',
      'logo': 'https://www.example.com/merck-logo.png',
    },
  ];

  int currentSponsor = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 3), (_) {
      setState(() {
        currentSponsor = (currentSponsor + 1) % sponsors.length;
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sponsor = sponsors[currentSponsor];
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade300, width: 4),
              ),
            ),
            Image.network(
              sponsor['logo'] ?? '',
              width: 160,
              height: 160,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) =>
                  const Icon(Icons.image_not_supported),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          sponsor['name'] ?? '',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
