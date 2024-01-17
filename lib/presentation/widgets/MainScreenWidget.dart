import 'package:flutter/material.dart';

class SText extends StatelessWidget {
  final String text;
  final String fontFamily;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;

  const SText(
      {super.key,
      required this.text,
      this.fontFamily = 'Montserrat',
      this.fontSize = 20.0,
      this.color = const Color(0xffF99417),
      this.fontWeight = FontWeight.w400});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          fontFamily: fontFamily,
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
        ));
  }
}

class MenuBtn extends StatelessWidget {
  const MenuBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 15, 0, 20),
      child: const Icon(
        Icons.menu,
        color: Color(0xfff99417),
        weight: 400,
      ),
    );
  }
}

class CityName extends StatelessWidget {
  final String cityName;
  const CityName({super.key, required this.cityName});

  @override
  Widget build(BuildContext context) {
    return SText(
      text: cityName,
      fontFamily: 'DancingScript',
      fontWeight: FontWeight.w800,
      fontSize: 40,
    );
  }
}

class MW400F12 extends StatelessWidget {
  final String text;
  const MW400F12({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SText(
      text: text,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    );
  }
}

class MW600F18 extends StatelessWidget {
  final String text;
  const MW600F18({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SText(
      text: text,
      fontWeight: FontWeight.w600,
      fontSize: 18,
    );
  }
}

class MW600F40 extends StatelessWidget {
  final String text;
  const MW600F40({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SText(
      text: text,
      fontSize: 40,
      fontWeight: FontWeight.w600,
    );
  }
}

class DSW400F25 extends StatelessWidget {
  final String text;
  const DSW400F25({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SText(
      text: text,
      fontFamily: 'DancingScript',
      fontWeight: FontWeight.w400,
      fontSize: 25,
    );
  }
}

class CDivider extends StatelessWidget {
  const CDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("I",
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
          color: Color(0xfff99417),
          fontSize: 80,
        ));
  }
}

class LColoumn extends StatelessWidget {
  final String imagePath;
  final String text;
  final String text2;
  const LColoumn({
    super.key,
    required this.imagePath,
    required this.text,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
          child: Image.asset(
            imagePath,
            width: 32,
            height: 32,
          ),
        ),
        MW400F12(text: text),
        DSW400F25(text: text2)
      ],
    );
  }
}
