import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const Super10App());
}

class Super10App extends StatelessWidget {
  const Super10App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Super10',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFFF7F8FC),
      ),
      home: const HomeScreen(),
    );
  }
}
