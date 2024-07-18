import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'login_states.dart';
part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  LoginBloc() : super(const LoginStates()) {
    on<EmailChanged>(_onEmailChange);
    on<PasswordChange>(_onPasswordChange);
    on<EmailUnfocussed>(_onEmailUnfocusse);
    on<PasswordUnfocussed>(_onPasswordUnfocusse);
  }
  void _onEmailChange(EmailChanged event, Emitter<LoginStates> emit) {
    //print(event.email);
    emit(
      state.copyWith(
        email: event.email,
      ),
    );
  }

  void _onPasswordChange(PasswordChange event, Emitter<LoginStates> emit) {
    emit(
      state.copyWith(
        password: event.password,
      ),
    );
  }

  void _onEmailUnfocusse(EmailUnfocussed event, Emitter<LoginStates> emit) {}
  void _onPasswordUnfocusse(
      PasswordUnfocussed event, Emitter<LoginStates> emit) {}
}
