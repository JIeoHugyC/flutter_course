import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task 7: Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/': (context) => const MainScreen(),
        '/redSquare': (context) => const RedSquareScreen(),
        '/date': (context) => const DateScreen(),
      },
      initialRoute: '/login',
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Login Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(
              context,
              '/',
            );
          },
          child: const Text('Auto Login'),
        ),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Main Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text('Main screen', style: TextStyle(fontSize: 50)),
            ),
            IconButton(
                iconSize: 50,
                onPressed: () => Navigator.pushNamed(context, '/redSquare'),
                icon: const Icon(Icons.arrow_circle_right_outlined)),
          ],
        ),
      ),
    );
  }
}

class RedSquareScreen extends StatelessWidget {
  const RedSquareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Red Square Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 200,
              height: 200,
              color: Colors.red,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  iconSize: 50,
                  onPressed: () => Navigator.pushNamed(context, '/'),
                  icon: const Icon(Icons.arrow_circle_left_outlined)),
              IconButton(
                  iconSize: 50,
                  onPressed: () => Navigator.pushNamed(context, '/date'),
                  icon: const Icon(Icons.arrow_circle_right_outlined)),
            ],
          ),
        ],
      ),
    );
  }
}

class DateScreen extends StatelessWidget {
  const DateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Date Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(DateFormat('dd MMMM yyyy').format(DateTime.now()),
                style: const TextStyle(fontSize: 50)),
          ),
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/redSquare'),
              iconSize: 50,
              icon: const Icon(Icons.arrow_circle_left_outlined)),
        ],
      ),
    );
  }
}
