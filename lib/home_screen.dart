// lib/home_screen.dart
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:medinova/widgets/slider_widget.dart';
import 'package:medinova/widgets/bmi_calculator.dart';
import 'package:medinova/widgets/health_tips.dart';
import 'package:medinova/widgets/horizontal_sponsor_slider.dart';
import 'package:medinova/widgets/newsletter_signup.dart';
import 'package:medinova/widgets/faq_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text("MediNova"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Dark mode follows your system settings.")),
              );
            },
          )
        ],
      ),
      body: Stack(
        children: [
          const AnimatedBackground(),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SliderWidget(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Welcome to MediNova",
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "Your digital bridge to licensed doctors, AI medicine suggestions, and secure real-time health services.",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 24),
                      Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: const [
                          AnimatedFeatureCard(
                            title: "Medicine Suggestions",
                            imageUrl:
                                "https://images.unsplash.com/photo-1585435557343-3b092031a831?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80",
                            description:
                                "AI-assisted medicine suggestions reviewed by certified pharmacists.",
                          ),
                          AnimatedFeatureCard(
                            title: "Expert Consultations",
                            imageUrl:
                                "https://images.unsplash.com/photo-1622253692010-333f2da6031d?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80",
                            description:
                                "Book secure consultations with specialists in various fields.",
                          ),
                          AnimatedFeatureCard(
                            title: "Health Articles",
                            imageUrl:
                                "https://images.unsplash.com/photo-1576091160399-112ba8d25d1d?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80",
                            description:
                                "Doctor-reviewed content on prevention, nutrition, and more.",
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      const BMICalculator(),
                      const SizedBox(height: 32),
                      const HealthTips(),
                      const SizedBox(height: 32),
                      Text(
                        "Why Choose MediNova?",
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      const AnimatedWhyChooseSection(),
                      const SizedBox(height: 32),
                      const HorizontalSponsorSlider(),
                      const SizedBox(height: 32),
                      const NewsletterSignup(),
                      const SizedBox(height: 32),
                      const FAQ(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground> with SingleTickerProviderStateMixin {
  final List<Offset> _dots = [];
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1))..repeat();
    WidgetsBinding.instance.addPostFrameCallback((_) => _generateDots());
  }

  void _generateDots() {
    final size = MediaQuery.of(context).size;
    for (int i = 0; i < 60; i++) {
      _dots.add(Offset(Random().nextDouble() * size.width, Random().nextDouble() * size.height));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: DotPainter(_dots, isDark ? Colors.blue.shade200 : Colors.blue.shade600, _controller.value),
          child: Container(),
        );
      },
    );
  }
}

class DotPainter extends CustomPainter {
  final List<Offset> dots;
  final Color color;
  final double animationValue;

  DotPainter(this.dots, this.color, this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color.withOpacity(1 - animationValue);
    for (final dot in dots) {
      canvas.drawCircle(dot, 2 + (4 * animationValue), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class AnimatedFeatureCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;

  const AnimatedFeatureCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 600),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 30 * (1 - value)),
            child: SizedBox(
              width: 320,
              child: Card(
                elevation: 3,
                child: Column(
                  children: [
                    Image.network(imageUrl, height: 150, width: double.infinity, fit: BoxFit.cover),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Text(title, style: Theme.of(context).textTheme.titleLarge),
                          const SizedBox(height: 8),
                          Text(description, style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class AnimatedWhyChooseSection extends StatelessWidget {
  const AnimatedWhyChooseSection({super.key});

  final List<Map<String, String>> reasons = const [
    {
      "title": "Expert Medical Advice",
      "desc": "Reviewed by certified professionals using WHO and CDC standards."
    },
    {
      "title": "Personalized Care",
      "desc": "AI + doctor-driven diagnostics tailored to your health."
    },
    {
      "title": "24/7 Accessibility",
      "desc": "Use anytime from mobile or desktop securely."
    },
    {
      "title": "E-Prescription Support",
      "desc": "Digital prescriptions filled from pharmacy partners."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: reasons
          .asMap()
          .entries
          .map(
            (entry) => TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 1),
              duration: Duration(milliseconds: 500 + (entry.key * 200)),
              builder: (context, value, child) {
                return Opacity(
                  opacity: value,
                  child: Transform.translate(
                    offset: Offset(0, 20 * (1 - value)),
                    child: SizedBox(
                      width: 300,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(entry.value["title"]!, style: Theme.of(context).textTheme.titleMedium),
                              const SizedBox(height: 8),
                              Text(entry.value["desc"]!, style: Theme.of(context).textTheme.bodyMedium),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
          .toList(),
    );
  }
}