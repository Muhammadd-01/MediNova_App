// medicine_card.dart
import 'package:flutter/material.dart';

class MedicineCard extends StatefulWidget {
  final String name;
  final String description;
  final String dosage;
  final List<String> sideEffects;
  final List<String> brandNames;
  final String imageUrl;

  const MedicineCard({
    super.key,
    required this.name,
    required this.description,
    required this.dosage,
    required this.sideEffects,
    required this.brandNames,
    required this.imageUrl,
  });

  @override
  State<MedicineCard> createState() => _MedicineCardState();
}

class _MedicineCardState extends State<MedicineCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(widget.imageUrl),
                ),
                const SizedBox(width: 16),
                Text(
                  widget.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(widget.description),
            const SizedBox(height: 8),
            Text("Dosage: ${widget.dosage}"),
            if (isExpanded) ...[
              const SizedBox(height: 12),
              const Text("Side Effects:", style: TextStyle(fontWeight: FontWeight.bold)),
              ...widget.sideEffects.map((e) => Text("• $e")),
              const SizedBox(height: 8),
              const Text("Brand Names:", style: TextStyle(fontWeight: FontWeight.bold)),
              Text(widget.brandNames.join(", ")),
            ],
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => setState(() => isExpanded = !isExpanded),
                child: Text(isExpanded ? "Show Less" : "Show More"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
