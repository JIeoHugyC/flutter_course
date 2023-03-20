import 'dart:math';
import 'employee_tile.dart';
import 'package:flutter/material.dart';

class EmployeesView extends StatefulWidget {
  const EmployeesView({Key? key}) : super(key: key);

  @override
  State<EmployeesView> createState() => _EmployeesViewState();
}

class _EmployeesViewState extends State<EmployeesView> {
  final List<EmployeeTile> employeeTiles =
      List.generate(20, (index) => EmployeeTile(num: index));

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollEndNotification &&
            _controller.position.extentAfter == 0) {
          setState(() {
            employeeTiles.add(EmployeeTile(num: employeeTiles.length));
          });
        }
        return false;
      },
      child: ListView.builder(
        controller: _controller,
        itemCount: employeeTiles.length,
        itemBuilder: (BuildContext context, int index) {
          return employeeTiles[index];
        },
      ),
    );
  }
}
