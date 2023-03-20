import 'package:flutter/material.dart';
import 'employees.dart';

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
          body: Center(
        child: SizedBox(
          height: 700,
          width: 500,
          child: EmployeesView(),
        ),
      )),
    );
  }
}
