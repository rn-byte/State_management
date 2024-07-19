import 'package:blc_st_mgmt_clean_archit/bloc/login/login_bloc.dart';
import 'package:blc_st_mgmt_clean_archit/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  FocusNode emailFocus = FocusNode();
  FocusNode passFocus = FocusNode();

  late LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc(loginRepository: getIt());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Login'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: BlocProvider(
          create: (context) => _loginBloc,
          child: Container(
            margin: const EdgeInsets.all(25),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InputEmailWidget(
                      emailFocus: emailFocus,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InputPasswordWidget(
                      passFocus: passFocus,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    LoginButtonWidget(
                      formKey: _formKey,
                    ),
                    const SizedBox(height: 20),
                    const DonotHaveAccountWidget(),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
