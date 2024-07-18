part of 'login_bloc.dart';

class LoginEvents extends Equatable {
  const LoginEvents();

  @override
  List<Object?> get props => [];
}

class EmailChanged extends LoginEvents {
  final String email;
  const EmailChanged({required this.email});

  @override
  List<Object?> get props => [email];
}

class EmailUnfocussed extends LoginEvents {}

class PasswordChange extends LoginEvents {
  final String password;
  const PasswordChange({required this.password});

  @override
  List<Object?> get props => [password];
}

class PasswordUnfocussed extends LoginEvents {}

class LoginButton extends LoginEvents {}
