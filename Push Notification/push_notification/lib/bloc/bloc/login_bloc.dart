import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:push_notification/home/home.dart';
import 'package:push_notification/services/firebase_auth_service.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoginTappedEvent>(_logintapped);
  }

  void _logintapped(LoginTappedEvent event, Emitter<LoginState> emit) async {
    log('bloc ms xiryo');
    emit(state.copywith(status: FormStatus.loadingState));

    final email = event.email;
    final password = event.password;

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Get.to(() => Home());
    } on FirebaseAuthException catch (e) {
      
      log(e.toString());
    } catch (e) {}
  }
}
