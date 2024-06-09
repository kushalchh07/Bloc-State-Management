part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeFavClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;
  HomeFavClickedEvent({
    required this.clickedProduct,
  });
}

class HomeCartClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;
  HomeCartClickedEvent({
    required this.clickedProduct,
  });
}

class HomeFavlistNavigateEvent extends HomeEvent {}

class HomeCartNavigateEvent extends HomeEvent {}
