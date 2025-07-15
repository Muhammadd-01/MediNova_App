// header.dart
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final bool isDarkMode;
  final void Function() onToggleDarkMode;
  final bool isAuthenticated;
  final void Function() onLogout;

  const Header({
    super.key,
    required this.isDarkMode,
    required this.onToggleDarkMode,
    required this.isAuthenticated,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: isDarkMode ? Colors.grey[900] : Colors.white,
      foregroundColor: isDarkMode ? Colors.white : Colors.black,
      elevation: 4,
      title: const Text('MediNova'),
      actions: [
        IconButton(
          icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
          onPressed: onToggleDarkMode,
        ),
        isAuthenticated
            ? TextButton(
                onPressed: onLogout,
                child: const Text('Logout', style: TextStyle(color: Colors.red)),
              )
            : Row(
                children: [
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/login'),
                    child: const Text('Login'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/register'),
                    child: const Text('Register'),
                  ),
                ],
              ),
      ],
    );
  }
}