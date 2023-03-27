import 'package:flutter/material.dart';
import 'weather_card.dart';
import 'weather_data.dart';

class Weather extends StatelessWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<WeatherDataModel>(
        stream: WeatherData().startMonitoring(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return WeatherCard(weatherDataModel: snapshot.requireData);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const CircularProgressIndicator();
        });
  }
}
