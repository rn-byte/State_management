import 'package:bloc_st_mgmt/bloc/login_signup/login_signup_bloc.dart';
import 'package:bloc_st_mgmt/ui/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginSignupBloc _loginSignupBloc;
  FocusNode emailFocus = FocusNode();
  FocusNode passFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _loginSignupBloc = LoginSignupBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _loginSignupBloc,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Bloc Login'),
            centerTitle: true,
            backgroundColor: Colors.blue,
            automaticallyImplyLeading: false,
          ),
          body: BlocProvider(
            create: (_) => _loginSignupBloc,
            child: Container(
              margin: const EdgeInsets.all(25),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BlocBuilder<LoginSignupBloc, LoginSignupState>(
                      buildWhen: (previous, current) =>
                          current.email != previous.email,
                      builder: (context, state) {
                        return TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          focusNode: emailFocus,
                          onChanged: (value) {
                            context
                                .read<LoginSignupBloc>()
                                .add(EmailChangedEvent(uEmail: value));
                          },
                          onFieldSubmitted: (value) {},
                          decoration: const InputDecoration(
                            hintText: 'Enter your Email',
                            prefixIcon: Icon(Icons.person_3_outlined),
                            label: Text('Enter your Email'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<LoginSignupBloc, LoginSignupState>(
                      buildWhen: (previous, current) =>
                          current.password != previous.password,
                      builder: (context, state) {
                        return TextFormField(
                          focusNode: passFocus,
                          onChanged: (value) {
                            context
                                .read<LoginSignupBloc>()
                                .add(PassChangedEvent(uPass: value));
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter your Password',
                            prefixIcon: const Icon(Icons.lock_outline),
                            suffixIcon: GestureDetector(
                              onTap: () {},
                              child: const Icon(
                                Icons.visibility,
                              ),
                            ),
                            label: const Text('Enter your Password'),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      height: 50,
                      width: 280,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.blue[200])),
                        onPressed: () {},
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an Account? '),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignupScreen(),
                                ));
                          },
                          child: Text(
                            'Signup ',
                            style: TextStyle(color: Colors.blue[500]),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
