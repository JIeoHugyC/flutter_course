import 'package:flutter/material.dart';
import 'colorful_squares.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: ColorfulSquares(
        size: 100,
        quantity: 9,
      )),
    );
  }
}
