import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_course/task_3/colorful_squares.dart';

final containerFinder = find.byWidgetPredicate((widget) {
  return widget is Container && widget.color != null;
});

Future<Iterable<Widget>> checkWidgets(
    WidgetTester tester, Size windowSize, int expectedWidgetsQuan) async {
  await tester.binding.setSurfaceSize(windowSize);
  await tester.pump();
  final containers = tester.widgetList(containerFinder);
  expect(containers.length, expectedWidgetsQuan,
      reason:
          'In window $windowSize should be $expectedWidgetsQuan colorful squares');

  for (var i = 0; i < containers.length; i++) {
    final container = containers.elementAt(i);
    final text = find.descendant(
      of: find.byWidget(container),
      matching: find.byType(Text),
      matchRoot: true,
    );
    expect(
      text,
      findsOneWidget,
      reason: 'Container at index $i does not contain Text widget',
    );
    expect(
      (tester.widget(text) as Text).data,
      equals('${i + 1}'),
      reason: 'Text inside container at index $i does not match the index+1',
    );
  }

  return containers;
}

class ContainsAllWidgetsMatcher extends Matcher {
  final Iterable<Widget> _expected;

  const ContainsAllWidgetsMatcher(this._expected);

  @override
  bool matches(dynamic actual, Map<dynamic, dynamic> matchState) {
    if (actual is! Iterable<Widget>) {
      return false;
    }
    for (var widget in _expected) {
      if (!actual.contains(widget)) {
        return false;
      }
    }
    return true;
  }

  @override
  Description describe(Description description) {
    return description.add('contains all widgets in $_expected');
  }
}

void main() {
  group('Task 3: LayoutBuilder', () {
    testWidgets('Displays n widgets', (WidgetTester tester) async {
      await tester.pumpWidget(const Directionality(
        textDirection: TextDirection.ltr,
        child: ColorfulSquares(
          quantity: 9,
          size: 100,
        ),
      ));

      await checkWidgets(tester, const Size(900, 100), 9);
      await checkWidgets(tester, const Size(100, 900), 9);
      await checkWidgets(tester, const Size(100, 100), 1);
      await checkWidgets(tester, const Size(90, 90), 0);
      await checkWidgets(tester, const Size(300, 300), 9);
      await checkWidgets(tester, const Size(299, 299), 4);
      await checkWidgets(tester, const Size(1000, 1000), 9);
    });

    testWidgets('Displays correct widgets', (WidgetTester tester) async {
      await tester.pumpWidget(const Directionality(
        textDirection: TextDirection.ltr,
        child: ColorfulSquares(
          quantity: 9,
          size: 100,
        ),
      ));

      final set1 = await checkWidgets(tester, const Size(900, 100), 9);
      final set2 = await checkWidgets(tester, const Size(200, 200), 4);
      expect(set1, ContainsAllWidgetsMatcher(set2));
    });
  });
}
