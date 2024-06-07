import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:login/Model/login_model.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginTappedEvent>(_logintapped);
  }

  FutureOr<void> _logintapped(
      LoginTappedEvent event, Emitter<LoginState> emit) {
    print("Log in button tapped");
  }
}
