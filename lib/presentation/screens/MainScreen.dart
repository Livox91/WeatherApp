import 'package:flutter/material.dart';
import '../widgets/MainScreenWidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Screen(),
          MenuBtn(),
        ],
      ),
    );
  }
}

class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
        color: const Color(0xff363062),
        width: screenSize.width,
        height: screenSize.height,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UpperSection(),
            LowerSection(),
          ],
        ));
  }
}

class UpperSection extends StatelessWidget {
  const UpperSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CityName(cityName: "Karachi"),
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
                  "lib/images/orange-cloud.png",
                  height: 64,
                  width: 64,
                )),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
              child: MW600F40(text: "10°C"),
            )
          ],
        )
      ],
    ));
  }
}

class LowerSection extends StatelessWidget {
  const LowerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: LColoumn(
                imagePath: "lib/images/orange-cloud.png",
                text: "Sunrise",
                text2: "7:00"),
          ),
          CDivider(),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: LColoumn(
                imagePath: "lib/images/orange-cloud.png",
                text: "Wind",
                text2: "4m/s"),
          ),
          CDivider(),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: LColoumn(
                imagePath: "lib/images/orange-cloud.png",
                text: "Tempreture",
                text2: "10°"),
          ),
        ],
      ),
    );
  }
}
