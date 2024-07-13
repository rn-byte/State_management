import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:bloc_st_mgmt/utils/enum/enums.dart';
import 'package:equatable/equatable.dart';
part 'login_signup_events.dart';
part 'login_signup_state.dart';

class LoginSignupBloc extends Bloc<LoginSignupEvents, LoginSignupState> {
  //final LoginSignupRepository _loginSignupRepository = LoginSignupRepository();
  LoginSignupBloc() : super(const LoginSignupState()) {
    on<EmailChangedEvent>(_onEmailChanged);
    on<PassChangedEvent>(_onPasswordChanged);
    on<LoginApi>(_loginApi);
    on<PassObscure>(_obscurePass);
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

    Map data = {
      'email': state.email.toString(),
      'password': state.password.toString(),
    };

    final response =
        await http.post(Uri.parse('https://reqres.in/api/login'), body: data);
    var msg = jsonDecode(response.body);
    if (response.statusCode == 200) {
      emit(state.copyWith(
          loginStatus: LoginStatus.success, message: msg['token'].toString()));
    } else {
      emit(state.copyWith(
          loginStatus: LoginStatus.error, message: msg['error'].toString()));
    }
  }

  void _obscurePass(PassObscure event, Emitter<LoginSignupState> emit) {
    //print('event ${state.obscure}');
    emit(state.copyWith(obscure: !state.obscure));
  }
}
