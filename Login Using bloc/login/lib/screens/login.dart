// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/login/login_bloc.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final loginBloc = LoginBloc();
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        // ignore: prefer_const_constructors
        child: Column(
          children: [
            TextField(
              controller: _emailController,
            ),
            TextField(
              controller: _passController,
            ),
            BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              bloc: loginBloc,
              builder: (context, state) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    loginBloc.add(LoginTappedEvent(
                        email: _emailController, password: _passController));
                  },
                  child: Text("Login"),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
