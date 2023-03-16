import 'dart:math';
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
  late final List<Widget> squares;

  @override
  void initState() {
    double x;
    squares = List.generate(9, (index) => _square(index + 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final screenWidth = constraints.maxWidth;
        final screenHeight = constraints.maxHeight;
        final columnQuan = (screenWidth / widget.size).floor();
        if (columnQuan <= 0) {
          return Container();
        }
        var rowQuan = (widget.quantity / columnQuan).floor() +
            (widget.quantity % columnQuan).ceil();
        if (screenHeight < (widget.size * rowQuan))
          rowQuan = (screenHeight / widget.size).floor();
        int index = 0;
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (int i = 0; i < rowQuan; i++)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (int j = 0; j < columnQuan && index < squares.length; j++)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        squares[index++],
                      ],
                    )
                ],
              ),
          ],
        );
      },
    );
  }

  Color _generateRandomColor() {
    final random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  Widget _square(int num) {
    return Container(
      height: widget.size,
      width: widget.size,
      color: _generateRandomColor(),
      child: Center(child: Text('$num')),
    );
  }
}
