import 'dart:math';
import 'employee_tile.dart';
import 'package:flutter/material.dart';

class EmployeesView extends StatefulWidget {
  const EmployeesView({Key? key}) : super(key: key);

  @override
  State<EmployeesView> createState() => _EmployeesViewState();
}

class _EmployeesViewState extends State<EmployeesView> {
  @override
  Widget build(BuildContext context) {
    return EmployeeTile(num: 0);
  }
}
