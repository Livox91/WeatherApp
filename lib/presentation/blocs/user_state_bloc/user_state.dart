import '../../../data/data_source/shared_pref.dart';

import 'package:bloc/bloc.dart';

enum SetupEvent { startSetup, completeSetup }

enum SetupState { initial, inProgress, completed }

class FirstTimeSetupBloc extends Bloc<SetupEvent, SetupState> {
  final SharedPreferencesApi sharedPref = SharedPreferencesApi();
  FirstTimeSetupBloc() : super(SetupState.initial) {
    on<SetupEvent>((event, emit) => mapEventsToState(event, emit));
  }

  void mapEventsToState(SetupEvent e, Emitter<SetupState> emit) async {
    if (e == SetupEvent.startSetup) {
      final isFirstTime = await sharedPref.isFirstTimeUser();
      if (isFirstTime) {
        emit(SetupState.inProgress);
      } else {
        emit(SetupState.completed);
      }
    }
    if (e == SetupEvent.completeSetup) {
      emit(SetupState.completed);
      await sharedPref.markSetupCompleted();
    }
  }
}
