part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeFavClickedEvent extends HomeEvent {}

class HomeCartClickedEvent extends HomeEvent {}

class HomeFavlistNavigateEvent extends HomeEvent {}

class HomeCartNavigateEvent extends HomeEvent {}
