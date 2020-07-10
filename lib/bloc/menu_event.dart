part of 'menu_bloc.dart';

abstract class MenuEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GoToWelcome extends MenuEvent {}

class GoToEdit extends MenuEvent {}
