import 'package:batu/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:batu/controllers/sound_controller.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SoundController(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'batu', debugShowCheckedModeBanner: false, home: HomePage());
  }
}
