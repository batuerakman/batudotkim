import 'package:batu/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'my portfolio site',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const HomePage());
  }
}
