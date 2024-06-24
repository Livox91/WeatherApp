import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/data_source/shared_pref.dart';

import 'main_screen_drawer.dart';
import 'text_widget.dart';

import 'package:flutter_application_1/domain/entities/city_country.dart';

class MenuBtn extends StatelessWidget {
  const MenuBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.menu),
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

class Btna extends StatefulWidget {
  final Map<CityCountry, bool> listWidget;
  const Btna({super.key, required this.listWidget});

  @override
  State<Btna> createState() => _BtnaState();
}

class _BtnaState extends State<Btna> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: const ButtonStyle(
        iconColor: MaterialStatePropertyAll(Color(0xfff99417)),
      ),
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return PopUpa(
                listWidget: widget.listWidget,
              );
            });
      },
      icon: const Icon(Icons.add),
    );
  }
}

class PopUpa extends StatefulWidget {
  final Map<CityCountry, bool> listWidget;
  const PopUpa({super.key, required this.listWidget});

  @override
  State<PopUpa> createState() => _PopUpaState();
}

class _PopUpaState extends State<PopUpa> {
  SharedPreferencesApi api = SharedPreferencesApi();

  void addWidget(texts, country) {
    setState(() {
      if (!dynamicWidget.any((widget) =>
          widget is Tile &&
          widget.text1 == "$texts" &&
          widget.text2 == "$country")) {
        dynamicWidget.add(Tile(text1: texts, text2: country));
      }
    });
  }

  void removeWidget(texts, country) {
    setState(() {
      dynamicWidget.removeWhere((widget) =>
          widget is Tile &&
          widget.text1 == "$texts" &&
          widget.text2 == "$country");
    });
  }

  @override
  void dispose() {
    api.saveCitiesCountriesStateToSharedPref(widget.listWidget);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xff363062),
        ),
        height: screenSize.height - 500,
        width: screenSize.width - 100,
        child: Card(
            color: const Color(0xff363062),
            child: ListView(
              children: widget.listWidget.keys.map((CityCountry key) {
                return CheckboxListTile(
                  title: SText(text: "${key.city},${key.country}"),
                  value: widget.listWidget[key],
                  onChanged: (bool? value) {
                    setState(() {
                      widget.listWidget[key] = value!;
                    });
                    if (value == true) {
                      setState(() {
                        addWidget(key.city, key.country);
                      });
                    } else {
                      setState(() {
                        removeWidget(key.city, key.country);
                      });
                    }
                  },
                );
              }).toList(),
            )),
      ),
    );
  }
}
