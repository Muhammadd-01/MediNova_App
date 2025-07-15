import 'package:flutter/material.dart';

class GoToTopButton extends StatelessWidget {
  final ScrollController controller;
  const GoToTopButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 24,
      right: 16,
      child: FloatingActionButton(
        onPressed: () {
          controller.animateTo(
            0,
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOut,
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.arrow_upward, color: Colors.white),
      ),
    );
  }
}
