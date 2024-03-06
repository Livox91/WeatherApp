import 'package:flutter/material.dart';

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

class RDivider extends StatelessWidget {
  const RDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("_________________________",
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w800,
          color: Color(0xfff99417),
          fontSize: 20,
        ));
  }
}
