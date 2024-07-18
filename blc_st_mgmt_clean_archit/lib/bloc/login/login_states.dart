part of 'login_bloc.dart';

class LoginStates extends Equatable {
  final String email;
  final String password;
  final Status status;
  final String error;

  const LoginStates({
    this.email = '',
    this.password = '',
    this.status = Status.initial,
    this.error = '',
  });

  LoginStates copyWith({
    String? email,
    String? password,
    Status? status,
    String? error,
  }) {
    return LoginStates(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [email, password, status, error];
}
