import 'package:flutter/material.dart';
// import 'package:pokemon_app/presentation/screens/counter/counter_screen.dart';
import 'package:pokemon_app/views/counter_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
      ),
      home: const CounterView(),
    );
  }
}
