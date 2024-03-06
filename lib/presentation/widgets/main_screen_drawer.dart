import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_application_1/presentation/blocs/weather_state_bloc/main_bloc.dart';

import 'text_widget.dart';
import 'divider_widget.dart';

List<Widget> dynamicWidget = [
  const DrawerHeader(
    child: DSW400F25(text: "Cities"),
  ),
  const Tile(text1: "Karachi", text2: "Pakistan"),
  const RDivider()
];

class SidePanel extends StatefulWidget {
  const SidePanel({super.key});

  @override
  State<SidePanel> createState() => _SidePanelState();
}

class _SidePanelState extends State<SidePanel> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xff363062),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 20, 0, 0),
        child: Column(children: dynamicWidget),
      ),
    );
  }
}

class Tile extends StatefulWidget {
  final String text1;
  final String text2;

  const Tile({
    super.key,
    required this.text1,
    required this.text2,
  });

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  _TileState();
  @override
  Widget build(BuildContext context) {
    final MainBloc mainBloc = BlocProvider.of<MainBloc>(context);
    return ListTile(
        title: MW600F18(text: widget.text1),
        onTap: () {
          mainBloc.add(MainEvent(widget.text1, widget.text2));
        });
  }
}
