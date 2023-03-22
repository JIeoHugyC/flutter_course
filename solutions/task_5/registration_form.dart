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
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  Color? _buttonColor;
  String? _emailError;
  String? _passwordError;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _register() async {
    bool isValidEmail = _validateEmail(_emailController.text);
    bool isValidPassword = _validatePassword(_passwordController.text);

    if (isValidEmail && isValidPassword) {
      setState(() {
        _buttonColor = Colors.green;
        _emailError = null;
        _passwordError = null;
      });

      _emailController.clear();
      _passwordController.clear();
    } else {
      setState(() {
        _buttonColor = Colors.red;
        _emailError = isValidEmail ? null : _invalidEmailMessage;
        _passwordError = isValidPassword ? null : _invalidPasswordMessage;
      });
    }

    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      _buttonColor = null;
    });
  }

  bool _validateEmail(String value) {
    return RegExp(r'^[\w-]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
  }

  bool _validatePassword(String value) {
    return value.isNotEmpty &&
        value.length >= 8 &&
        RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]')
            .hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              errorText: _emailError,
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'Password',
              errorText: _passwordError,
            ),
            obscureText: true,
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: _register,
            style: ElevatedButton.styleFrom(
              backgroundColor: _buttonColor,
            ),
            child: const Text('Register'),
          ),
        ],
      ),
    );
  }
}
