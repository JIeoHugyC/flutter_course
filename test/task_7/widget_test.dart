import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:flutter_course/task_7/main.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Login Screen to Main Screen navigation',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final autoLoginButton = find.text('Auto Login');
    expect(autoLoginButton, findsOneWidget);
    await tester.tap(autoLoginButton);
    await tester.pumpAndSettle();

    final mainScreenTitle = find.text('Main Screen');
    expect(mainScreenTitle, findsOneWidget);

    final NavigatorState navigator = tester.state(find.byType(Navigator));
    navigator.pop();
    await tester.pumpAndSettle();
    expect(mainScreenTitle, findsOneWidget);
  });

  testWidgets('Navigation logic is correct', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final autoLoginButton = find.text('Auto Login');
    expect(autoLoginButton, findsOneWidget);
    await tester.tap(autoLoginButton);
    await tester.pumpAndSettle();

    final mainScreenTitle = find.text('Main Screen');
    expect(mainScreenTitle, findsOneWidget);

    final redSquareButton = find.byType(IconButton).at(0);
    expect(redSquareButton, findsOneWidget);
    await tester.tap(redSquareButton);
    await tester.pumpAndSettle();

    final redSquareTitle = find.text('Red Square Screen');
    expect(redSquareTitle, findsOneWidget);

    final dateButton = find.byType(IconButton).at(1);
    expect(dateButton, findsOneWidget);
    await tester.tap(dateButton);
    await tester.pumpAndSettle();

    final dateTitle = find.text('Date Screen');
    expect(dateTitle, findsOneWidget);

    final backButton = find.byType(IconButton).at(0);
    expect(backButton, findsOneWidget);
    await tester.tap(backButton);
    await tester.pumpAndSettle();

    expect(redSquareTitle, findsOneWidget);

    await tester.tap(find.byType(IconButton).at(0));
    await tester.pumpAndSettle();

    expect(mainScreenTitle, findsOneWidget);
  });

  testWidgets('Date format is correct', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final autoLoginButton = find.text('Auto Login');
    expect(autoLoginButton, findsOneWidget);
    await tester.tap(autoLoginButton);
    await tester.pumpAndSettle();

    final redSquareButton = find.byType(IconButton).at(0);
    expect(redSquareButton, findsOneWidget);
    await tester.tap(redSquareButton);
    await tester.pumpAndSettle();

    final dateButton = find.byType(IconButton).at(1);
    expect(dateButton, findsOneWidget);
    await tester.tap(dateButton);
    await tester.pumpAndSettle();

    final dateTitle = find.text('Date Screen');
    expect(dateTitle, findsOneWidget);

    final dateFormat = DateFormat('dd MMMM yyyy');
    final currentDate = dateFormat.format(DateTime.now());
    final dateText = find.text(currentDate);
    expect(dateText, findsOneWidget);
  });
}
