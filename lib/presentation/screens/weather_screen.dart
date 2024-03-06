import 'package:flutter/material.dart';

import '../widgets/main_screen_drawer.dart';
import '../widgets/divider_widget.dart';
import '../widgets/text_widget.dart';
import '../widgets/main_screen_widgets.dart';
import '../../domain/entities/weather.dart';

class HomePage extends StatelessWidget {
  final Weather weatherData;
  const HomePage({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SidePanel(),
      body: Stack(
        children: [
          Screen(
            weatherData: weatherData,
          ),
          const MenuBtn(),
          const Btn()
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
    return Scaffold(
      drawer: const Drawer(),
      body: Container(
          color: const Color(0xff363062),
          width: screenSize.width,
          height: screenSize.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UpperSection(weatherData: weatherData),
              LowerSection(weatherData: weatherData),
            ],
          )),
    );
  }
}

class UpperSection extends StatelessWidget {
  final Weather weatherData;
  const UpperSection({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String dayOfWeek = _getDayOfWeek(now.weekday);

    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CityName(cityName: weatherData.locationDetail.city),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: MW600F18(text: dayOfWeek),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: MW600F18(
                  text:
                      '${_formatNumber(now.hour)}:${_formatNumber(now.minute)}'),
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

  String _formatNumber(int number) {
    return number.toString().padLeft(2, '0');
  }

  String _getDayOfWeek(int day) {
    switch (day) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return '';
    }
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
