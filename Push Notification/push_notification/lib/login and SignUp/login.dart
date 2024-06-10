// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:push_notification/bloc/bloc/login_bloc.dart';
import 'package:push_notification/home/home.dart';
import 'package:push_notification/login%20and%20SignUp/signup.dart';
import 'package:push_notification/services/firebase_auth_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final LoginBloc loginBloc = LoginBloc();
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: BlocListener<LoginBloc, LoginState>(
          bloc: loginBloc,
          listener: (context, state) {
            // Add this line for debugging
          },
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        log('Button pressed');
                        // Perform login logic with _emailController.text and _passwordController.text
                        // await AuthService.loginWithEmail(
                        //         _emailController.text,
                        //         _passwordController.text)
                        //     .then((value) {
                        //   if (value == "Logged In successfully") {
                        //     _showSnackBar(value, Colors.green);
                        //   } else {
                        //     _showSnackBar(value, Colors.red);
                        //   }
                        // });
                        context.read<LoginBloc>().add(LoginTappedEvent(
                            email: _emailController.text,
                            password: _passwordController.text));
                        // Navigator.pushNamedAndRemoveUntil(
                        //     context, "/home", (context) => false);
                        print(
                            'Email: //${_emailController.text}, Password: ${_passwordController.text}');
                      }
                    },
                    child: Text('Login'),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()));
                      },
                      child: Text("Dont have an Account ? Register Here."))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
