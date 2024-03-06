import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/blocs/weather_state_bloc/main_bloc.dart';
//screens
import 'package:flutter_application_1/presentation/screens/logo_screen.dart';
import 'package:flutter_application_1/presentation/screens/weather_screen.dart';
//BloCs
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_application_1/presentation/blocs/new_user_setup_bloc/new_user_setup_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocProvider(
      create: (context) => MainBloc(),
      child: const Main(),
    ));
  }
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    final MainBloc mainBloc = BlocProvider.of<MainBloc>(context);
    return BlocConsumer<MainBloc, MainState>(
        builder: (context, state) {
          if (state is MainLoadingState) {
            mainBloc.add(const MainEvent("Karachi", "Pk"));
            return const LoadingScreen();
          } else if (state is MainErrorState) {
            return const Text("Error");
          } else if (state is MainDataState) {
            return HomePage(weatherData: state.currentWeather);
          } else {
            return const Text("No Data");
          }
        },
        listener: (context, state) {});
  }
}

class FirstTimeWidget extends StatelessWidget {
  const FirstTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final FirstTimeSetupBloc setupBloc =
        BlocProvider.of<FirstTimeSetupBloc>(context);
    return Center(
      child: BlocBuilder<FirstTimeSetupBloc, SetupState>(
        builder: (context, state) {
          if (state == SetupState.initial) {
            setupBloc.add(SetupEvent.startSetup);
          }
          if (state == SetupState.inProgress) {
            setupBloc.add(SetupEvent.completeSetup);
            return const CircularProgressIndicator();
          } else if (state == SetupState.completed) {
            return const Text("Setup Completed");
          }
          return Container();
        },
      ),
    );
  }
}

/*BlocProvider(
        create: (context) => MainBloc(),
        child: const Main(),
      ),*/