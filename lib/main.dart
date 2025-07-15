import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:medinova/theme/dark_mode_provider.dart';
import 'home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => DarkModeProvider(),
      child: const MediNovaApp(),
    ),
  );
}

class MediNovaApp extends StatelessWidget {
  const MediNovaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MediNova',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: Provider.of<DarkModeProvider>(context).isDarkMode ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
