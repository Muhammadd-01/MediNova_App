import 'package:flutter/material.dart';

class NewsletterSignup extends StatefulWidget {
  const NewsletterSignup({super.key});

  @override
  State<NewsletterSignup> createState() => _NewsletterSignupState();
}

class _NewsletterSignupState extends State<NewsletterSignup> {
  final TextEditingController _emailController = TextEditingController();
  bool submitted = false;

  void _subscribe() {
    if (_emailController.text.isNotEmpty) {
      setState(() {
        submitted = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.only(top: 32),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[800] : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Subscribe to Our Newsletter',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          const Text(
            'Get the latest health tips and updates in your inbox.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          if (!submitted) ...[
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Enter your email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _subscribe,
              child: const Text('Subscribe'),
            ),
          ] else ...[
            const Icon(Icons.check_circle, color: Colors.green, size: 40),
            const SizedBox(height: 8),
            const Text('Thanks for subscribing!')
          ]
        ],
      ),
    );
  }
}