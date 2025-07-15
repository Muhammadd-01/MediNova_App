import 'package:flutter/material.dart';

class HealthTips extends StatelessWidget {
  const HealthTips({super.key});

  final List<String> tips = const [
    "Stay hydrated by drinking at least 8 glasses of water a day.",
    "Aim for at least 30 minutes of moderate exercise 5 days a week.",
    "Eat a balanced diet rich in fruits, vegetables, and whole grains.",
    "Get 7-9 hours of sleep each night for optimal health.",
    "Practice stress-reduction techniques like meditation or deep breathing.",
    "Limit processed foods and sugary drinks in your diet.",
    "Don't skip breakfast – it's the most important meal of the day.",
    "Regular health check-ups can help detect issues early.",
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[800] : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Health Tips',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ...tips.asMap().entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '• ',
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                  ),
                  Expanded(
                    child: Text(
                      entry.value,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
