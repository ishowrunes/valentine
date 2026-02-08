import 'package:flutter/material.dart';
import 'package:valentine/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Valentine',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: primary),
      ),
      home: const Home(),
    );
  }
}
