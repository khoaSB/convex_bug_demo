part of 'menu_bloc.dart';

abstract class MenuState extends Equatable {
  const MenuState();

  @override
  List<Object> get props => [];
}

class AtWelcome extends MenuState {}

class AtEdit extends MenuState {}
