import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_management/data/phones.dart';
import 'package:bloc_management/models/product_data_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialevent);
    on<HomeFavClickedEvent>(homeFavClickedEvent);
    on<HomeCartClickedEvent>(homeCartClickedEvent);
    on<HomeCartNavigateEvent>(homeCartNavigateEvent);
    on<HomeFavlistNavigateEvent>(homeFavlistNavigateEvent);

    // on<HomeFavClickedEvent>();
  }
  FutureOr<void> homeInitialevent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    log('Hami homeinitialevent Function bhitra cham');
    try {
      emit(HomeLoadingState());
      log('hami loading state ma aayem');
      await Future.delayed(Duration(seconds: 3));
      log('hami 3 seconds wait garem');

      emit(HomeLoadedSuccessState(
          products: MobilePhones.items
              .map((e) => ProductDataModel(
                    id: e['id'],
                    description: e['description'],
                    title: e['title'],
                    imageUrl: e['imageUrl'],
                    price: e['price'],
                  ))
              .toList()));
      log('hami loadeed state pass garem');
    } catch (e) {
      log(e.toString());
    }
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
