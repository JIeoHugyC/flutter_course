import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
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
                  width: 200,
                  height: 200,
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
                width: 200,
                height: 200,
                color: Colors.red,
                child: const Center(
                  child: Text(
                    'Red square',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
