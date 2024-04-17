import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/blocs/user_state_bloc/user_state.dart';
import 'package:flutter_application_1/presentation/widgets/text_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Setup extends StatefulWidget {
  const Setup({super.key});

  @override
  State<Setup> createState() => _SetupState();
}

class _SetupState extends State<Setup> with TickerProviderStateMixin {
  late Widget currentChild, setup1, setup;
  late final AnimationController _controller;
  bool isAnimationComplete = false;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    super.initState();
    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isAnimationComplete = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    setup1 = const NameField();
    setup = const Greeting();
    if (!isAnimationComplete) {
      currentChild = setup;
    } else {
      currentChild = setup1;
    }
    return Container(
      width: screenSize.width,
      height: screenSize.height,
      color: const Color(0xff363062),
      child: currentChild,
    );
  }
}

class NameField extends StatefulWidget {
  const NameField({super.key});

  @override
  State<NameField> createState() => _NameFieldState();
}

class _NameFieldState extends State<NameField> {
  late final TextEditingController _nameController;

  String? _nameError;

  @override
  void initState() {
    _nameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          color: const Color(0xff363062),
          child: TextField(
            controller: _nameController,
            decoration: InputDecoration(
                labelText: 'Please Enter Your Name: ',
                border: const UnderlineInputBorder(),
                labelStyle: const TextStyle(color: Color(0xfff99417)),
                errorText: _nameError),
            style: const TextStyle(color: Color(0xfff99417)),
            cursorColor: const Color(0xfff99417),
          ),
        ),
        FloatingActionButton.small(onPressed: () {
          final name = _nameController.text;
          if (name.isEmpty) {
            setState(() {
              _nameError = "Invalid Input";
            });
          } else {
            final FirstTimeSetupBloc setup =
                BlocProvider.of<FirstTimeSetupBloc>(context);
            setup.add(SetupEvent.completeSetup);
          }
        })
      ],
    );
  }
}

class Greeting extends StatelessWidget {
  const Greeting({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: MW600F18(text: "Hello!"),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: MW600F18(text: "Preparing First Time Setup..."),
        ),
      ],
    );
  }
}
