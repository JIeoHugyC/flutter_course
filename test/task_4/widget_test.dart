import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_course/task_4/employees.dart';
import 'package:flutter_course/task_4/employee_tile.dart';

void main() {
  group('EmployeesView', () {
    testWidgets('should render 20 EmployeeTiles initially',
        (WidgetTester tester) async {
      await tester
          .pumpWidget(const MaterialApp(home: Scaffold(body: EmployeesView())));
      await tester.binding.setSurfaceSize(const Size(500, 1900));
      await tester.pump();
      final tilesFinder = find.byType(EmployeeTile);
      expect(tilesFinder, findsNWidgets(20));
    });

    testWidgets(
        'should render additional EmployeeTile when scroll reaches end of list',
        (WidgetTester tester) async {
      await tester
          .pumpWidget(const MaterialApp(home: Scaffold(body: EmployeesView())));
      await tester.binding.setSurfaceSize(const Size(500, 700));
      await tester.pump();

      final tilesFinder = find.byType(EmployeeTile);
      final firstEmployeeName =
          (tester.widget(tilesFinder.first) as EmployeeTile).name;
      var lastEmployeeName =
          (tester.widget(tilesFinder.last) as EmployeeTile).name;

      for (int i = 0; i < 25; i++) {
        await tester.drag(find.byType(ListView), const Offset(0, -500));
        await tester.pump();
        final curLastEmployeeName =
            (tester.widget(tilesFinder.last) as EmployeeTile).name;
        expect(lastEmployeeName, isNot(curLastEmployeeName));
        lastEmployeeName = curLastEmployeeName;
      }
      for (int i = 0; i < 25; i++) {
        await tester.drag(find.byType(ListView), const Offset(0, 500));
        await tester.pump();
      }
      final curLastEmployeeName =
          (tester.widget(tilesFinder.first) as EmployeeTile).name;
      expect(firstEmployeeName, curLastEmployeeName);
    });
  });
}
