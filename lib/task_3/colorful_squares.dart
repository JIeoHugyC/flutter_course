import 'package:flutter/material.dart';

class ColorfulSquares extends StatefulWidget {
  final double size;
  final int quantity;

  const ColorfulSquares({required this.size, required this.quantity, Key? key})
      : super(key: key);

  @override
  State<ColorfulSquares> createState() => _ColorfulSquaresState();
}

class _ColorfulSquaresState extends State<ColorfulSquares> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
        'Here should be ${widget.quantity} squares with side length ${widget.size}');
  }
}
