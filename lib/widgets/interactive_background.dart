// interactive_background.dart
import 'package:flutter/material.dart';
import 'dart:math';

class InteractiveBackground extends StatefulWidget {
  const InteractiveBackground({super.key});

  @override
  State<InteractiveBackground> createState() => _InteractiveBackgroundState();
}

class _InteractiveBackgroundState extends State<InteractiveBackground> with SingleTickerProviderStateMixin {
  final List<_Dot> _dots = [];
  late AnimationController _controller;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _generateInitialDots();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1))
      ..addListener(() => setState(() {}))
      ..repeat();
  }

  void _generateInitialDots() {
    for (int i = 0; i < 50; i++) {
      _dots.add(
        _Dot(
          x: _random.nextDouble() * MediaQuery.of(context).size.width,
          y: _random.nextDouble() * MediaQuery.of(context).size.height,
          size: _random.nextDouble() * 6 + 2,
          color: Colors.blueAccent,
        ),
      );
    }
  }

  void _handleTap(TapDownDetails details) {
    setState(() {
      _dots.add(
        _Dot(
          x: details.globalPosition.dx,
          y: details.globalPosition.dy,
          size: _random.nextDouble() * 6 + 2,
          color: Colors.blueAccent,
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTapDown: _handleTap,
      child: Stack(
        children: _dots.map((dot) {
          return Positioned(
            left: dot.x,
            top: dot.y,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Opacity(
                  opacity: 1 - _controller.value,
                  child: Transform.scale(
                    scale: 1 + _controller.value,
                    child: Container(
                      width: dot.size,
                      height: dot.size,
                      decoration: BoxDecoration(
                        color: dot.color,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _Dot {
  final double x;
  final double y;
  final double size;
  final Color color;

  _Dot({required this.x, required this.y, required this.size, required this.color});
}
