part of 'login_signup_bloc.dart';

class LoginSignupState extends Equatable {
  final String email;
  final String password;
  final String message;
  final LoginStatus loginStatus;
  const LoginSignupState({
    this.email = '',
    this.password = '',
    this.message = '',
    this.loginStatus = LoginStatus.initial,
  });

  LoginSignupState copyWith({
    String? email,
    String? password,
    String? message,
    LoginStatus? loginStatus,
  }) {
    return LoginSignupState(
      email: email ?? this.email,
      password: password ?? this.password,
      message: message ?? this.message,
      loginStatus: loginStatus ?? this.loginStatus,
    );
  }

  @override
  List<Object?> get props => [];
}
