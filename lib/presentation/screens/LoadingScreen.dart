import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      color: const Color(0xff363062),
      width: screenSize.width,
      height: screenSize.height,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/orange-cloud.png",
              width: 64,
              height: 64,
            ),
            const SizedBox(
              height: 20,
            ),
            const SpinKitDoubleBounce(
              color: Color(0xfff99417),
              size: 50.0,
            )
          ],
        ),
      ),
    );
  }
}
