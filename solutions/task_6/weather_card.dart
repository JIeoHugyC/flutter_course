import 'package:flutter/material.dart';
import 'weather_data.dart';

class WeatherCard extends StatelessWidget {
  final WeatherDataModel weatherDataModel;

  const WeatherCard({Key? key, required this.weatherDataModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Text(
          weatherDataModel.city,
          style: const TextStyle(fontSize: 24.0),
        )),
        Text('Temperature: ${weatherDataModel.temperature}°C',
            style: const TextStyle(fontSize: 16.0)),
        Text('Weather: ${weatherDataModel.weather}',
            style: const TextStyle(fontSize: 16.0)),
      ],
    );
  }
}
