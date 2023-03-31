import 'package:flutter/material.dart';
import 'bloc/data_receiver_bloc.dart';
import 'data_loader.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'locator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Explicit Animations',
      home: BlocProvider(
        create: (context) => locator<DataReceiverBloc>(),
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explicit Animations'),
      ),
      body: Center(
        child: SizedBox(
          width: screenWidth * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    locator<DataReceiverBloc>().add(StartLoadingEvent());
                  },
                  child: const Text('Load data')),
              const SizedBox(
                height: 15,
              ),
              const DataLoader(),
            ],
          ),
        ),
      ),
    );
  }
}
