part of 'login_signup_bloc.dart';

abstract class LoginSignupEvents extends Equatable {
  const LoginSignupEvents();

  @override
  List<Object?> get props => [];
}

class EmailChangedEvent extends LoginSignupEvents {
  final String uEmail;

  const EmailChangedEvent({
    required this.uEmail,
  });
  @override
  List<Object?> get props => [uEmail];
}

class PassChangedEvent extends LoginSignupEvents {
  final String uPass;

  const PassChangedEvent({
    required this.uPass,
  });
  @override
  List<Object?> get props => [uPass];
}

class LoginApi extends LoginSignupEvents {}

class PassObscure extends LoginSignupEvents {
  // final bool obscure;
  // const PassObscure({
  //   required this.obscure,
  // });

  // @override
  // List<Object?> get props => [obscure];
}
