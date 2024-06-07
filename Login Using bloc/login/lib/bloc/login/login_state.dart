part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LoginSuccessfulState extends LoginState {
  List<LoginModel> loginResponse;

  LoginSuccessfulState({required this.loginResponse});
}

class LoginFailureState extends LoginState {
  String message;
  LoginFailureState({required this.message});
}

class LoginErrorState extends LoginState {
  String error;
  LoginErrorState({required this.error});
}

class LoginUnverifiedState extends LoginState {
  dynamic userId;
  List<LoginModel> loginResponses;

  LoginUnverifiedState({required this.loginResponses, required this.userId});
}
