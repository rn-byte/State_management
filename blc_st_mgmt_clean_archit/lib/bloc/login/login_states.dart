part of 'login_bloc.dart';

class LoginStates extends Equatable {
  final String email;
  final String password;
  final Status status;
  final String message;

  const LoginStates({
    this.email = '',
    this.password = '',
    this.status = Status.initial,
    this.message = '',
  });

  LoginStates copyWith({
    String? email,
    String? password,
    Status? status,
    String? message,
  }) {
    return LoginStates(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [email, password, status, message];
}
