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
          decoration: TextDecoration.none,
        ));
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
