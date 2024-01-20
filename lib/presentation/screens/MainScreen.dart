import 'package:flutter/material.dart';
import '../widgets/MainScreenWidget.dart';
import '../../domain/entities/weather.dart';

class HomePage extends StatelessWidget {
  final Weather weatherData;
  const HomePage({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Screen(
            weatherData: weatherData,
          ),
          const MenuBtn(),
        ],
      ),
    );
  }
}

class Screen extends StatelessWidget {
  final Weather weatherData;
  const Screen({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
        color: const Color(0xff363062),
        width: screenSize.width,
        height: screenSize.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UpperSection(weatherData: weatherData),
            LowerSection(weatherData: weatherData),
          ],
        ));
  }
}

class UpperSection extends StatelessWidget {
  final Weather weatherData;
  const UpperSection({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CityName(cityName: weatherData.locationDetail.city),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(5.0),
              child: MW600F18(text: "Monday"),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: MW600F18(text: "7:00PM"),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                child: Image.asset(
                  "assets/images/orange-cloud.png",
                  height: 64,
                  width: 64,
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
              child:
                  MW600F40(text: "${weatherData.weatherDetails.temperature}°C"),
            )
          ],
        )
      ],
    ));
  }
}

class LowerSection extends StatelessWidget {
  final Weather weatherData;
  const LowerSection({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: LColoumn(
                imagePath: "assets/images/orange-moon.png",
                text: "Sunrise",
                text2:
                    "${weatherData.time.sunrise.hour}:${weatherData.time.sunrise.minute}"),
          ),
          const CDivider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: LColoumn(
                imagePath: "assets/images/orange-Barometer.png",
                text: "Wind",
                text2: "${weatherData.weatherDetails.windSpeed}m/s"),
          ),
          const CDivider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: LColoumn(
                imagePath: "assets/images/orange-thermometer.png",
                text: "humidity",
                text2: "${weatherData.weatherDetails.humidity}%"),
          ),
        ],
      ),
    );
  }
}
