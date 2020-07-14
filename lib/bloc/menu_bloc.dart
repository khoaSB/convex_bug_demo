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
      yield* _mapGoToWelcome();
    } else if (event is GoToEdit) {
      yield* _mapGoToEdit();
    } else if (event is GoToProfile) {
      yield* _mapGoToProfile();
    } else if (event is GoToSearch) {
      yield* _mapGoToSearch();
    }
  }

  Stream<MenuState> _mapGoToWelcome() async* {
    convexKey.currentState.animateTo(0);
    yield AtWelcome();
  }

  Stream<MenuState> _mapGoToEdit() async* {
    convexKey.currentState.animateTo(1);
    yield AtEdit();
  }

  Stream<MenuState> _mapGoToProfile() async* {
    convexKey.currentState.animateTo(2);
    yield AtProfile();
  }

  Stream<MenuState> _mapGoToSearch() async* {
    convexKey.currentState.animateTo(3);
    yield AtSearch();
  }
}
