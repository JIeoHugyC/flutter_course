import 'package:flutter/material.dart';
import 'package:faker_dart/faker_dart.dart';

class EmployeeTile extends StatefulWidget {
  final int num;
  final String name = Faker.instance.name.fullName();
  final String address = Faker.instance.address.city();

  EmployeeTile({Key? key, required this.num}) : super(key: key);

  @override
  State<EmployeeTile> createState() => _EmployeeTileState();
}

class _EmployeeTileState extends State<EmployeeTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.account_box_sharp),
      title: Text('#ID ${widget.num}: ${widget.name}'),
      subtitle: Text(widget.address),
      trailing: const Icon(Icons.more_vert),
      onTap: () {},
    );
  }
}
