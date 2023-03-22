// registration_form_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_course/task_5/registration_form.dart';

void main() {
  testWidgets('RegistrationForm input validation and button color change', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: Scaffold(body: RegistrationForm())));

    final emailField = find.byType(TextField).at(0);
    final passwordField = find.byType(TextField).at(1);
    final registerButton = find.byType(ElevatedButton);

    // Test: Empty email and password fields
    await tester.tap(registerButton);
    await tester.pump(const Duration(seconds: 3));

    expect(find.text('Please enter a valid email'), findsOneWidget);
    expect(
        find.text('Password must have at least 8 characters, 1 uppercase, 1 lowercase, 1 digit and 1 special character'),
        findsOneWidget);

    // Test: Invalid email
    await tester.enterText(emailField, 'invalid_email');
    await tester.enterText(passwordField, 'ValidP@ss1');
    await tester.tap(registerButton);
    await tester.pump(const Duration(seconds: 3));

    expect(find.text('Please enter a valid email'), findsOneWidget);
    expect(find.text('Password must have at least 8 characters, 1 uppercase, 1 lowercase, 1 digit and 1 special character'), findsNothing);

    // Test: Invalid password
    await tester.enterText(emailField, 'valid@email.com');
    await tester.enterText(passwordField, 'invalidpassword');
    await tester.tap(registerButton);
    await tester.pump(const Duration(seconds: 3));

    expect(find.text('Please enter a valid email'), findsNothing);
    expect(
        find.text('Password must have at least 8 characters, 1 uppercase, 1 lowercase, 1 digit and 1 special character'),
        findsOneWidget);

    // Test: Valid email and password
    await tester.enterText(emailField, 'valid@email.com');
    await tester.enterText(passwordField, 'ValidP@ss1');
    await tester.tap(registerButton);
    await tester.pump();

    final buttonMaterial = tester.widget<ElevatedButton>(registerButton).style?.backgroundColor?.resolve({});
    expect(buttonMaterial, Colors.green);

    await tester.pump(const Duration(seconds: 3));
    final buttonMaterialAfterDelay = tester.widget<ElevatedButton>(registerButton).style?.backgroundColor?.resolve({});
    expect(buttonMaterialAfterDelay, null);
  });
}
