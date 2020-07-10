import 'package:convex_bug_demo/key.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc() : super(AtWelcome());

  @override
  Stream<MenuState> mapEventToState(MenuEvent event) async* {
    if (event is GoToWelcome) {
      yield* _mapGoToHome();
    } else if (event is GoToEdit) {
      yield* _mapGoToEdit();
    }
  }

  Stream<MenuState> _mapGoToHome() async* {
    convexKey.currentState.animateTo(0);
    yield AtWelcome();
  }

  Stream<MenuState> _mapGoToEdit() async* {
    convexKey.currentState.animateTo(1);
    yield AtEdit();
  }
}
