import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_course/task_1/main.dart';
import '../test_extentions.dart';

void main() {
  group('Markup Task 1', () {
    const dSquareSide = 200;
    late final Offset textCenter;
    late final Offset yellowSquareCenter;
    late final Offset redSquareCenter;

    testWidgets('Displays correct text', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      final text = find.text('Markup task 1');
      expect(text, findsOneWidget);
      expect(find.text('Yellow square'), findsOneWidget);
      expect(find.text('Red square'), findsOneWidget);
      expect(tester.getCenter(text).dx, tester.windowSize.width / 2);
      textCenter = tester.getCenter(text);
    });

    testWidgets('Displays correct yellow square', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      final square = find.byElementPredicate((element) =>
          element.widget is Container &&
          (element.widget as Container).color == Colors.yellow);
      expect(square, findsOneWidget,
          reason: "The task is to place only one yellow container");
      final squareLeftSide = tester.getBottomLeft(square);
      expect(squareLeftSide.dx, 0,
          reason: "Please position the yellow square on the left side");
      expect(squareLeftSide.dy, isNot(tester.windowSize.height));
      expect(squareLeftSide.dy, isNot(tester.windowSize.height));
      expect(tester.getRect(square).width, dSquareSide);
      expect(tester.getRect(square).height, dSquareSide);
      yellowSquareCenter = tester.getCenter(square);
    });

    testWidgets('Displays correct red square', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      final square = find.byElementPredicate((element) =>
          element.widget is Container &&
          (element.widget as Container).color == Colors.red);
      expect(square, findsOneWidget);
      final squareRightSide = tester.getBottomRight(square);
      expect(squareRightSide.dx, tester.windowSize.width,
          reason: "Please position the red square on the right side");
      expect(squareRightSide.dy, tester.windowSize.height);
      expect(tester.getRect(square).width, dSquareSide);
      expect(tester.getRect(square).height, dSquareSide);
      redSquareCenter = tester.getCenter(square);
    });

    testWidgets('Relative positioning', (WidgetTester tester) async {
      /// important: run this test only after successfully running previous tests
      /// because they should save widget variables (run only within group test)
      expect(textCenter.dy, lessThan(yellowSquareCenter.dy));
      expect(yellowSquareCenter.dy, lessThan(redSquareCenter.dy));
    });
  });
}
