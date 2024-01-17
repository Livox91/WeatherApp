import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyHomePage(),
  ));
}

class Section1 extends StatelessWidget {
  const Section1({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      color: const Color(0xFF363062),
      width: screenSize.width,
      height: screenSize.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Karachi",
                  style: TextStyle(
                    fontFamily: 'DancingScript',
                    fontWeight: FontWeight.w800,
                    color: Color(0xffF99417),
                    fontSize: 40,
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Text("MONDAY",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            color: Color(0xfff99417),
                            fontSize: 18,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Text("7:30 AM",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            color: Color(0xfff99417),
                            fontSize: 18,
                          )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                        child: Image.asset("lib/images/orange-cloud.png",
                            height: 64, width: 64)),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                      child: Text(
                        "10°",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          color: Color(0xfff99417),
                          fontSize: 40,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        "C",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          color: Color(0xfff99417),
                          fontSize: 35,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const Section2()
        ],
      ),
    );
  }
}

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(30, 15, 0, 20),
        child: const Row(children: [
          Icon(
            Icons.menu,
            color: Color(0xffF99417),
            weight: 400,
          )
        ]));
  }
}

class Section2 extends StatelessWidget {
  const Section2({super.key});

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
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                    child: Image.asset("lib/images/orange-cloud.png",
                        height: 32, width: 32)),
                const Text(
                  "Sunrise",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    color: Color(0xfff99417),
                    fontSize: 12,
                  ),
                ),
                const Text(
                  "7:00",
                  style: TextStyle(
                    fontFamily: 'DancingScript',
                    fontWeight: FontWeight.w400,
                    color: Color(0xfff99417),
                    fontSize: 25,
                  ),
                )
              ],
            ),
          ),
          const Text("I",
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                color: Color(0xfff99417),
                fontSize: 80,
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                    child: Image.asset("lib/images/orange-cloud.png",
                        height: 32, width: 32)),
                const Text(
                  "Wind",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    color: Color(0xfff99417),
                    fontSize: 12,
                  ),
                ),
                const Text(
                  "4m/s",
                  style: TextStyle(
                    fontFamily: 'DancingScript',
                    fontWeight: FontWeight.w400,
                    color: Color(0xfff99417),
                    fontSize: 25,
                  ),
                )
              ],
            ),
          ),
          const Text("I",
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                color: Color(0xfff99417),
                fontSize: 80,
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                    child: Image.asset("lib/images/orange-cloud.png",
                        height: 32, width: 32)),
                const Text(
                  "Tempreture",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    color: Color(0xfff99417),
                    fontSize: 12,
                  ),
                ),
                const Text(
                  "23°",
                  style: TextStyle(
                    fontFamily: 'DancingScript',
                    fontWeight: FontWeight.w400,
                    color: Color(0xfff99417),
                    fontSize: 25,
                  ),
                )
              ],
            ),
          ),
        ],
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
    return const Scaffold(
      body: Column(
        children: [
          Stack(
            children: [Section1(), Navigation()],
          )
        ],
      ),
    );
  }
}
