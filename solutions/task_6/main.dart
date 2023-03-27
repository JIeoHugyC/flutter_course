import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_course/task_6/weather.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: WeatherApp(),
  ));
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather app')),
      body: Center(
        child: FutureBuilder<bool>(
            future: _checkPermissions(),
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                return const Weather();
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}

Future<bool> _checkPermissions() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }
  return true;
}
