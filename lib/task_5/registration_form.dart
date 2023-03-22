import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  static const _invalidPasswordMessage =
      'Password must have at least 8 characters, 1 uppercase, 1 lowercase, 1 digit and 1 special character';
  static const _invalidEmailMessage = 'Please enter a valid email';

  @override
  void dispose() {
    super.dispose();
  }

  void _register() async {}

  @override
  Widget build(BuildContext context) {
    return const Text('Replace me');
  }
}
