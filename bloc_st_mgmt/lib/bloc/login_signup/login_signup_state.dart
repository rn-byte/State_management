part of 'login_signup_bloc.dart';

class LoginSignupState extends Equatable {
  final String email;
  final String password;
  final String message;
  final LoginStatus loginStatus;
  final bool obscure;
  const LoginSignupState({
    this.email = '',
    this.password = '',
    this.message = '',
    this.loginStatus = LoginStatus.initial,
    this.obscure = true,
  });

  LoginSignupState copyWith({
    String? email,
    String? password,
    String? message,
    LoginStatus? loginStatus,
    bool? obscure,
  }) {
    return LoginSignupState(
      email: email ?? this.email,
      password: password ?? this.password,
      message: message ?? this.message,
      loginStatus: loginStatus ?? this.loginStatus,
      obscure: obscure ?? this.obscure,
    );
  }

  @override
  List<Object?> get props => [email, password, message, loginStatus, obscure];
}
