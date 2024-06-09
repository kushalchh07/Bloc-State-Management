// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:bloc_management/features/home/bloc/home_bloc.dart';
import 'package:bloc_management/features/home/ui/producttile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      // bloc: homeBloc,
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;

            return Scaffold(
            

              appBar: AppBar(
                
                backgroundColor: Colors.teal,
                title: Text('Mobile Store '),
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeFavlistNavigateEvent());
                      },
                      icon: Icon(Icons.favorite_border)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeCartNavigateEvent());
                      },
                      icon: Icon(Icons.shopping_bag_outlined)),
                ],
              ),
              body: ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: (context, index) {
                    return ProductTileWidget(
                        homeBloc: homeBloc,
                        productDataModel: successState.products[index]);
                  }),
            );

          case HomeErrorState:
            return Scaffold(body: Center(child: Text('Error')));
          default:
            return SizedBox();
        }
        // if (state.runtimeType is HomeLoadingState) {
        //   return Center(
        //     child: SizedBox(
        //       height: 50,
        //       width: 50,
        //       child: CupertinoActivityIndicator(),
        //     ),
        //   );
        // }
        // if (state.runtimeType is HomeLoadedSuccessState) {
        //   log('Hami home loadded success state bhitra cham');
        //   final successState = state as HomeLoadedSuccessState;
        //   return Scaffold(
        //     appBar: AppBar(
        //       title: Text("E-Commerce"),
        //       actions: [
        //         IconButton(
        //             onPressed: () {
        //               homeBloc.add(HomeFavlistNavigateEvent());
        //             },
        //             icon: Icon(Icons.favorite_border_outlined)),
        //         IconButton(
        //             onPressed: () {
        //               homeBloc.add(HomeCartNavigateEvent());
        //             },
        //             icon: Icon(Icons.shopping_cart_outlined))
        //       ],
        //     ),
        //     body: ListView.builder(
        //         itemCount: successState.products.length,
        //         itemBuilder: (context, index) {
        //           return ProductTileWidget(
        //               homeBloc: homeBloc,
        //               productDataModel: successState.products[index]);
        //         }),
        //   );
        // }
        // if (state.runtimeType is HomeErrorState) {
        //   return Scaffold(
        //     body: Center(
        //       child: Text("Error Occurred"),
        //     ),
        //   );
        // }
        // return SizedBox();
      },
    );
  }
}
