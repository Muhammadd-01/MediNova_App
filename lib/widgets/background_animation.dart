import 'dart:math';
import 'package:flutter/material.dart';

class BackgroundAnimation extends StatefulWidget {
  final bool isDarkMode;
  const BackgroundAnimation({super.key, required this.isDarkMode});

  @override
  State<BackgroundAnimation> createState() => _BackgroundAnimationState();
}

class _BackgroundAnimationState extends State<BackgroundAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final random = Random();

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 20))
          ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  LinearGradient get gradient => widget.isDarkMode
      ? const LinearGradient(
          colors: [Color(0xFF1a202c), Color(0xFF2d3748), Color(0xFF4a5568)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )
      : const LinearGradient(
          colors: [Color(0xFFe6f2ff), Color(0xFFFFFFFF), Color(0xFFcce4ff)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, _) => Container(
            decoration: BoxDecoration(gradient: gradient),
          ),
        ),
        ...List.generate(30, (index) {
          final size = random.nextDouble() * 4 + 2;
          final top = random.nextDouble() * MediaQuery.of(context).size.height;
          final left =
              random.nextDouble() * MediaQuery.of(context).size.width;
          return AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              return Positioned(
                top: top + sin(_controller.value * 2 * pi) * 20,
                left: left + cos(_controller.value * 2 * pi) * 20,
                child: Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.isDarkMode
                        ? Colors.blue.shade300.withOpacity(0.6)
                        : Colors.blue.shade600.withOpacity(0.6),
                  ),
                ),
              );
            },
          );
        }),
      ],
    );
  }
}
