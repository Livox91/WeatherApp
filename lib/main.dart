import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/blocs/bloc/main_bloc.dart';
import 'package:flutter_application_1/presentation/screens/MainScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './presentation/screens/LoadingScreen.dart';

void main() {
  runApp(MaterialApp(
    home: BlocProvider(
      create: (context) => MainBloc(),
      child: const Main(),
    ),
  ));
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
