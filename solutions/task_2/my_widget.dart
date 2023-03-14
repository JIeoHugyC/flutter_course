import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        rectangle(Colors.orange, 1),
        rectangle(Colors.green, 2),
        rectangle(Colors.blue, 3),
      ],
    );
  }

  Widget emptySpace() => const Flexible(flex: 1, child: SizedBox.expand());

  Widget rectangle(Color color, int flex) {
    return Flexible(
      flex: flex,
      fit: FlexFit.loose,
      child: SizedBox(
        height: 100,
        width: double.infinity,
        child: Row(
          children: [
            emptySpace(),
            Flexible(
              flex: 18,
              child: Container(
                color: color,
              ),
            ),
            emptySpace(),
          ],
        ),
      ),
    );
  }
}
