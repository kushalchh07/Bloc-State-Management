import 'package:bloc_management/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Bloc Management"),
            actions: [
              IconButton(
                onPressed: () {
                  homeBloc.add((HomeCartNavigateEvent()));
                },
                icon: Icon(Icons.shopping_cart_outlined),
              ),
              IconButton(
                onPressed: () {
                  homeBloc.add(HomeFavlistNavigateEvent());
                },
                icon: Icon(Icons.favorite_border_outlined),
              ),
            ],
          ),
        );
      },
    );
  }
}
