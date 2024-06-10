part of 'login_bloc.dart';

enum FormStatus {
  initalState,
  loadingState,
  successState,
  failureState
}

@immutable



final class LoginState {
  final String email;
  final String password;
  final FormStatus status;
  final String errorMsg;
  LoginState(
      {this.email = "",
      this.password = "",
      this.status = FormStatus.initalState,
      this.errorMsg = ""});

  LoginState copywith(
   { String? email,
    String? password,
    FormStatus? status,
    String? errorMsg, }
  ) =>
      LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status,
        errorMsg: errorMsg ?? this.errorMsg,
      );

  // void add(Type loginTappedEvent) {}
}



// final class LoginInitial extends LoginState {}

// final class LoginSuccessState extends LoginState {
  
// }

// final class LoginFailureState extends LoginState {}

// final class EmailUnverfiedState extends LoginState {}
