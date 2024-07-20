import 'package:blc_st_mgmt_clean_archit/repository/auth/login_repository.dart';
import 'package:blc_st_mgmt_clean_archit/services/session_manager/session_controller.dart';
import 'package:blc_st_mgmt_clean_archit/utils/enum/enums.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'login_states.dart';
part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  LoginRepository loginRepository;
  LoginBloc({required this.loginRepository}) : super(const LoginStates()) {
    on<EmailChanged>(_onEmailChange);
    on<PasswordChange>(_onPasswordChange);
    on<EmailUnfocussed>(_onEmailUnfocusse);
    on<PasswordUnfocussed>(_onPasswordUnfocusse);
    on<LoginApi>(_loginApi);
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

  void _loginApi(LoginApi event, Emitter<LoginStates> emit) async {
    Map data = {
      'email': state.email,
      'password': state.password,
    };
    emit(state.copyWith(status: Status.loading));
    await loginRepository.loginApi(data).then((value) async {
      if (value.error.isEmpty) {
        await SessionController().saveUserInPreference(value);
        await SessionController().getUserFromPreference();
        emit(state.copyWith(
            message: 'Login Successfull', status: Status.success));
      } else {
        emit(state.copyWith(
            message: value.error.toString(), status: Status.error));
      }
    }).onError((error, stackTrace) {
      emit(state.copyWith(
        message: error.toString(),
        status: Status.error,
      ));
    });
  }
}
