import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/entities/weather.dart';
import 'package:flutter_application_1/presentation/screens/MainScreen.dart';
import './data/repository/weather_Repository.dart';
import './presentation/screens/LoadingScreen.dart';

void main() {
  runApp(const MaterialApp(
    home: Main(),
  ));
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Weather>(
        future: WeatherRepository.getWeatherData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          } else if (snapshot.hasError) {
            return const Text("Error");
          } else {
            Weather weatherData = snapshot.data!;
            return HomePage(
              weatherData: weatherData,
            );
          }
        });
  }
}
