import 'dart:async';
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class WeatherDataModel {
  final String city;
  final double temperature;
  final String weather;

  WeatherDataModel(
      {required this.temperature, required this.weather, required this.city});
}

class WeatherData {
  static const _apiKey = 'your_key';
  static const _updateInterval = Duration(seconds: 10);

  Stream<WeatherDataModel> startMonitoring() async* {
    for (;;) {
      final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      var response = await http.get(Uri.parse(
          'https://api.openweathermap.org/geo/1.0/reverse?lat=${position.latitude}&lon=${position.longitude}&limit=5&appid=$_apiKey'));
      final city = (jsonDecode(response.body))[0]['name'];
      var statusCode = response.statusCode;
      if (statusCode == 200) {
        response = await http.get(Uri.parse(
            'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$_apiKey&units=metric'));
        statusCode = response.statusCode;
        if (statusCode == 200) {
          yield _fromJson(jsonDecode(response.body));
        }
      }
      if (statusCode != 200) {
        yield* Stream.error('Failed to load weather data');
      }
      await Future.delayed(_updateInterval);
    }
  }

  WeatherDataModel _fromJson(Map<String, dynamic> json) {
    return WeatherDataModel(
      city: json['name'],
      temperature: json['main']['temp'].toDouble(),
      weather: json['weather'][0]['description'],
    );
  }
}
