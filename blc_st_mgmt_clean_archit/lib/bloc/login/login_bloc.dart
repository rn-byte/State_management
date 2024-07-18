import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'login_states.dart';
part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  LoginBloc() : super(const LoginStates()) {
    on<EmailChanged>(_emailChanged);
    on<PasswordChange>(_passwordChanged);
    on<EmailUnfocussed>(_emailUnfocussed);
    on<PasswordUnfocussed>(_passwordUnfocussed);
  }
  void _emailChanged(EmailChanged event, Emitter<LoginStates> emit) {}
  void _passwordChanged(PasswordChange event, Emitter<LoginStates> emit) {}
  void _emailUnfocussed(EmailUnfocussed event, Emitter<LoginStates> emit) {}
  void _passwordUnfocussed(
      PasswordUnfocussed event, Emitter<LoginStates> emit) {}
}
