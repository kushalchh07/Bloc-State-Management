import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeFavClickedEvent>(homeFavClickedEvent);
    on<HomeCartClickedEvent>(homeCartClickedEvent);
    on<HomeCartNavigateEvent>(homeCartNavigateEvent);
    on<HomeFavlistNavigateEvent>(homeFavlistNavigateEvent);

    // on<HomeFavClickedEvent>();
  }

  FutureOr<void> homeFavClickedEvent(
      HomeFavClickedEvent event, Emitter<HomeState> emit) {
    print("Fav Icon Clicked");
  }

  FutureOr<void> homeCartClickedEvent(
      HomeCartClickedEvent event, Emitter<HomeState> emit) {}

  FutureOr<void> homeCartNavigateEvent(
      HomeCartNavigateEvent event, Emitter<HomeState> emit) {
    // print("Fav Icon Clicked");
  }

  FutureOr<void> homeFavlistNavigateEvent(
      HomeFavlistNavigateEvent event, Emitter<HomeState> emit) {}
}
