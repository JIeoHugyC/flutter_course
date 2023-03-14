import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:flutter_course/task_2/my_widget.dart';
import '../test_extentions.dart';

void main() {
  testGoldens('MyWidget 500x300', (WidgetTester tester) async {
    const widget = MyWidget();
    await tester.pumpWidgetBuilder(widget, surfaceSize: const Size(500, 300));
    await expectLater(
      find.byType(MyWidget),
      matchesGoldenFile('my_widget_500x300.png'),
    );
  });
  testGoldens('MyWidget 500x90', (WidgetTester tester) async {
    const widget = MyWidget();
    await tester.pumpWidgetBuilder(widget, surfaceSize: const Size(500, 90));
    await expectLater(
      find.byType(MyWidget),
      matchesGoldenFile('my_widget_500x100.png'),
    );
  });
  testGoldens('MyWidget 500x500', (WidgetTester tester) async {
    const widget = MyWidget();
    await tester.pumpWidgetBuilder(widget, surfaceSize: const Size(500, 500));
    await expectLater(
      find.byType(MyWidget),
      matchesGoldenFile('my_widget_500x500.png'),
    );
  });
  testGoldens('MyWidget 20x90', (WidgetTester tester) async {
    const widget = MyWidget();
    await tester.pumpWidgetBuilder(widget, surfaceSize: const Size(20, 90));
    await expectLater(
      find.byType(MyWidget),
      matchesGoldenFile('my_widget_20x90.png'),
    );
  });
  testGoldens('MyWidget 100x500', (WidgetTester tester) async {
    const widget = MyWidget();
    await tester.pumpWidgetBuilder(widget, surfaceSize: const Size(100, 500));
    await expectLater(
      find.byType(MyWidget),
      matchesGoldenFile('my_widget_100x500.png'),
    );
  });
}
