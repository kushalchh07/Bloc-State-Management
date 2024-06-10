// login_event.dart
part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginTappedEvent extends LoginEvent {
  final String email;
  final String password;

  LoginTappedEvent({required this.email, required this.password});
}
