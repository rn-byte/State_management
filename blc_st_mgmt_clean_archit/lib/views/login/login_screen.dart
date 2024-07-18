import 'package:flutter/material.dart';
import 'widgets/donot_have_account_widget.dart';
import 'widgets/input_email_widget.dart';
import 'widgets/input_password_widget.dart';
import 'widgets/login_button_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Login'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        margin: const EdgeInsets.all(25),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const InputEmailWidget(),
                const SizedBox(
                  height: 20,
                ),
                const InputPasswordWidget(),
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
    );
  }
}
