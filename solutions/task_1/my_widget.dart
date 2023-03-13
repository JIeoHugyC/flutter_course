import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({
    super.key,
  });

  static const double sideLength = 200;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 50),
          child: const Text(
            'Markup task 1',
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: sideLength,
              height: sideLength,
              color: Colors.yellow,
              child: const Center(
                child: Text(
                  'Yellow square',
                ),
              ),
            ),
          ],
        ),
        Container(
          alignment: Alignment.bottomRight,
          child: Container(
            width: sideLength,
            height: sideLength,
            color: Colors.red,
            child: const Center(
              child: Text(
                'Red square',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
