import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course/task_10/bloc/data_receiver_bloc.dart';

class DataLoader extends StatelessWidget {
  const DataLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const LinearProgressIndicator(
      minHeight: 50,
      value: 0.5,
    );
  }
}
