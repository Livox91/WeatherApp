import '../../../data/repository/new_user_repository.dart';
import 'package:bloc/bloc.dart';

enum SetupEvent { startSetup, completeSetup }

enum SetupState { initial, inProgress, completed }

class FirstTimeSetupBloc extends Bloc<SetupEvent, SetupState> {
  final SharedPreferencesRepository repository = SharedPreferencesRepository();
  FirstTimeSetupBloc() : super(SetupState.initial) {
    on<SetupEvent>((event, emit) => mapEventsToState(event, emit));
  }

  void mapEventsToState(SetupEvent e, Emitter<SetupState> emit) async {
    if (e == SetupEvent.startSetup) {
      emit(SetupState.inProgress);
      final isFirstTime = await repository.isFirstTimeUser();
      if (isFirstTime) {
        print("Hello First Time User");
      }
    }
    if (e == SetupEvent.completeSetup) {
      emit(SetupState.completed);
      await repository.markSetupCompleted();
    }
  }
}
