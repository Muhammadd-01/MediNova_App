import 'package:flutter/material.dart';

class FAQItem {
  final String question;
  final String answer;
  bool isExpanded;

  FAQItem({required this.question, required this.answer, this.isExpanded = false});
}

class FAQ extends StatefulWidget {
  const FAQ({super.key});

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  final List<FAQItem> _faqs = [
    FAQItem(
      question: 'What is MediNova?',
      answer: 'MediNova is a digital health platform providing medical consultations, articles, and tools.',
    ),
    FAQItem(
      question: 'Are doctors certified?',
      answer: 'Yes, all doctors on MediNova are licensed and verified professionals.',
    ),
    FAQItem(
      question: 'Is my data secure?',
      answer: 'Absolutely. We comply with HIPAA and other data protection regulations.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.only(top: 32, bottom: 32),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[800] : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _faqs[index].isExpanded = !isExpanded;
          });
        },
        children: _faqs.map<ExpansionPanel>((FAQItem faq) {
          return ExpansionPanel(
            headerBuilder: (context, isExpanded) {
              return ListTile(
                title: Text(
                  faq.question,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              );
            },
            body: ListTile(
              title: Text(faq.answer),
            ),
            isExpanded: faq.isExpanded,
          );
        }).toList(),
      ),
    );
  }
}