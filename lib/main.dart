import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/blocs/weather_state_bloc/main_bloc.dart';
//screens
import 'package:flutter_application_1/presentation/screens/logo_screen.dart';
import 'package:flutter_application_1/presentation/screens/weather_screen.dart';
//BloCs
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_application_1/presentation/blocs/user_state_bloc/user_state.dart';

import 'data/data_source/location_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocProvider(
      create: (context) => FirstTimeSetupBloc(),
      child: const FirstTimeWidget(),
    ));
  }
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  Placemark? placemark;
  late MainBloc mainBloc;
  @override
  void initState() {
    _getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mainBloc = BlocProvider.of<MainBloc>(context);
    return BlocConsumer<MainBloc, MainState>(builder: (context, state) {
      if (state is MainLoadingState) {
        return const LoadingScreen();
      } else if (state is MainErrorState) {
        return const Text("Error");
      } else if (state is MainDataState) {
        return HomePage(weatherData: state.currentWeather);
      } else {
        return const Text("No Data");
      }
    }, listener: (context, state) {
      if (placemark != null && state is MainLoadingState) {
        mainBloc.add(MainEvent(placemark!.locality, placemark!.country));
      }
    });
  }

  _getLocation() async {
    LocationService locationService = LocationService();

    Position? position = await locationService.getCurrentLocation();
    if (position != null) {
      Placemark? newPlacemark =
          await locationService.getCityAndCountry(position);
      setState(() {
        placemark = newPlacemark;
      });
    }
    if (placemark != null) {
      mainBloc.add(MainEvent(placemark!.locality, placemark!.country));
    }
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
          } else if (state == SetupState.completed) {
            return BlocProvider(
              create: (context) => MainBloc(),
              child: const Main(),
            );
          }
          return Container();
        },
      ),
    );
  }
}
