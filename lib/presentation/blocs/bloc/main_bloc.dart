import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/repository/weather_Repository.dart';
import 'package:flutter_application_1/domain/entities/weather.dart';

import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainLoadingState()) {
    on<MainEvent>(
      (event, emit) => mapStatetoEvent(event, emit),
    );
  }

  void mapStatetoEvent(MainEvent event, Emitter<MainState> emit) async {
    try {
      Weather newWeather = await WeatherRepository.getWeatherData(
          city: event.newCity, country: event.newCountry);

      emit(MainDataState(event.newCity, event.newCountry, newWeather));
    } catch (e) {
      emit(MainErrorState());
    }
  }
}
