import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/blocs/bloc/main_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dart_casing/dart_casing.dart';

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
      padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
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

class Btn extends StatelessWidget {
  const Btn({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 20, 20, 0),
        child: ElevatedButton(
            style: const ButtonStyle(
                iconColor: MaterialStatePropertyAll(Color(0xff363062)),
                backgroundColor: MaterialStatePropertyAll(Color(0xfff99417))),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const PopUp();
                  });
            },
            child: const Icon(Icons.add)),
      ),
    );
  }
}

class PopUp extends StatefulWidget {
  const PopUp({super.key});

  @override
  State<PopUp> createState() => _PopUpState();
}

class _PopUpState extends State<PopUp> {
  late final TextEditingController _cityController;
  late final TextEditingController _countryController;

  String? _countryError;
  String? _cityError;

  List<String> countries = ['pakistan', 'india', 'afghanistan', 'uk'];
  Map<String, List<String>> citiesbyCountry = {
    "pakistan": ["islamabad", "karachi", "multan"],
    "india": ["dehli", "hyderabad", "rajasthan"],
    "afghanistan": ["kabul", "ghazni", "herat"],
    "uk": ["london", "birmingham", "bristol", "nottingham"]
  };
  @override
  void initState() {
    _countryController = TextEditingController();
    _cityController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _cityController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  void addWidget(texts, country) {
    setState(() {
      dynamicWidget.add(Tile(text1: texts, text2: country));
      dynamicWidget.add(const RDivider());
    });
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
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: MW600F18(text: "Enter City/Country"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _cityController,
                  decoration: InputDecoration(
                    labelText: 'City',
                    border: const UnderlineInputBorder(),
                    labelStyle: const TextStyle(color: Color(0xfff99417)),
                    errorText: _cityError,
                  ),
                  style: const TextStyle(color: Color(0xfff99417)),
                  cursorColor: const Color(0xfff99417),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _countryController,
                  decoration: InputDecoration(
                    labelText: 'Country',
                    border: const UnderlineInputBorder(),
                    errorText: _countryError,
                    labelStyle: const TextStyle(color: Color(0xfff99417)),
                  ),
                  style: const TextStyle(color: Color(0xfff99417)),
                  cursorColor: const Color(0xfff99417),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {
                      final city = _cityController.text.toLowerCase();
                      final country = _countryController.text.toLowerCase();
                      if (country.isEmpty || city.isEmpty) {
                        setState(() {
                          _countryError = "Invalid Input";
                          _cityError = "Invalid Input";
                        });
                      } else if (countries.contains(country) &&
                          citiesbyCountry.containsKey(country) &&
                          citiesbyCountry[country]!.contains(city)) {
                        addWidget(Casing.pascalCase(city), country);
                        setState(() {
                          _cityError = null;
                          _countryError = null;
                        });

                        _cityController.clear();
                        _countryController.clear();
                      } else {
                        setState(() {
                          _countryError = "Invalid Input";
                          _cityError = "Invalid Input";
                        });
                      }
                    },
                    child: const MW600F18(text: "Submit")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
