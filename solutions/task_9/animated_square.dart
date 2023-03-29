import 'package:flutter/material.dart';

class AnimatedSquare extends StatefulWidget {
  const AnimatedSquare({Key? key}) : super(key: key);

  @override
  State<AnimatedSquare> createState() => _AnimatedSquareState();
}

class _AnimatedSquareState extends State<AnimatedSquare> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: isExpanded ? 200 : 100,
        height: isExpanded ? 200 : 100,
        color: isExpanded ? Colors.yellow : Colors.red,
      ),
    );
  }
}
