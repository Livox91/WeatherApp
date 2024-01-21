part of 'main_bloc.dart';

@immutable
class MainEvent extends Equatable {
  final String newCity;
  final String newCountry;
  const MainEvent(this.newCity, this.newCountry);

  @override
  List<Object?> get props => [newCity];
}
