import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(const MediNovaApp());
}

class MediNovaApp extends StatelessWidget {
  const MediNovaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MediNova',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
