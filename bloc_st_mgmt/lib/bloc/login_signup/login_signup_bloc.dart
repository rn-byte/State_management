import 'package:bloc/bloc.dart';
import 'package:bloc_st_mgmt/utils/enum/enums.dart';
import 'package:equatable/equatable.dart';
part 'login_signup_events.dart';
part 'login_signup_state.dart';

class LoginSignupBloc extends Bloc<LoginSignupEvents, LoginSignupState> {
  LoginSignupBloc() : super(const LoginSignupState()) {
    on<EmailChangedEvent>(_onEmailChanged);
    on<PassChangedEvent>(_onPasswordChanged);
  }

  void _onEmailChanged(
      EmailChangedEvent event, Emitter<LoginSignupState> emit) {
    // print(event.uEmail);
    emit(state.copyWith(email: event.uEmail));
  }

  void _onPasswordChanged(
      PassChangedEvent event, Emitter<LoginSignupState> emit) {
    //print(event.uPass);
    emit(state.copyWith(password: event.uPass));
  }
}
