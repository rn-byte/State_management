import 'package:bloc/bloc.dart';
import 'package:bloc_st_mgmt/repository/login_signup_repository.dart';
import 'package:bloc_st_mgmt/utils/enum/enums.dart';
import 'package:equatable/equatable.dart';
part 'login_signup_events.dart';
part 'login_signup_state.dart';

class LoginSignupBloc extends Bloc<LoginSignupEvents, LoginSignupState> {
  final LoginSignupRepository _loginSignupRepository = LoginSignupRepository();
  LoginSignupBloc() : super(const LoginSignupState()) {
    on<EmailChangedEvent>(_onEmailChanged);
    on<PassChangedEvent>(_onPasswordChanged);
    on<LoginApi>(_loginApi);
  }

  void _onEmailChanged(
      EmailChangedEvent event, Emitter<LoginSignupState> emit) {
    // print(event.uEmail);
    emit(state.copyWith(email: event.uEmail));
  }

  void _onPasswordChanged(
      PassChangedEvent event, Emitter<LoginSignupState> emit) {
    // print(event.uPass);
    emit(state.copyWith(password: event.uPass));
  }

  void _loginApi(LoginApi event, Emitter<LoginSignupState> emit) async {
    emit(state.copyWith(loginStatus: LoginStatus.loading));
    print(state.email.toString());
    print(state.password.toString());
    Map data = {
      'email': state.email.toString(),
      'password': state.password,
    };
    print(data.toString());
    await _loginSignupRepository.hitLogin(data).then((value) {
      emit(state.copyWith(
        message: 'Login Success : Token:  ${value['token'].toString()}',
        loginStatus: LoginStatus.success,
      ));
    }).onError((error, stackTrace) {
      emit(state.copyWith(
          message: 'Login Error : ${error.toString}',
          loginStatus: LoginStatus.error));
    });
  }
}
