part of 'main_bloc.dart';

@immutable
class MainState extends Equatable {
  const MainState();
  @override
  List<Object?> get props => [];
}

class MainDataState extends MainState {
  final String currentCity;
  final String currentCountry;
  final Weather currentWeather;

  const MainDataState(
      this.currentCity, this.currentCountry, this.currentWeather);

  @override
  List<Object?> get props => [currentCity, currentWeather];
}

class MainLoadingState extends MainState {}

class MainErrorState extends MainState {}
