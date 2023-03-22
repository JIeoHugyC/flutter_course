import 'package:flutter/material.dart';
import 'registration_form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Registration Form')),
        body: RegistrationForm(),
      ),
    );
  }
}
