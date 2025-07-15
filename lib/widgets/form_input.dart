import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  final String label;
  final String type;
  final String id;
  final String name;
  final String value;
  final Function(String)? onChanged;
  final bool required;
  final TextEditingController? controller;

  const FormInput({
    super.key,
    required this.label,
    required this.type,
    required this.id,
    required this.name,
    required this.value,
    this.onChanged,
    this.required = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          onChanged: onChanged,
          obscureText: type == 'password',
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          ),
        ),
      ],
    );
  }
}
