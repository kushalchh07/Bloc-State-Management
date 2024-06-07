part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginInitialEvent extends LoginEvent {}

class LoginTappedEvent extends LoginEvent {
  dynamic email;
  dynamic password;
  // dynamic contact;
  LoginTappedEvent({
    required this.email,
    required this.password,
    // required this.contact,
  });
}