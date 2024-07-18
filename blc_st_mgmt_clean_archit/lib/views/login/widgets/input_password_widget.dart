import 'package:blc_st_mgmt_clean_archit/bloc/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class InputPasswordWidget extends StatelessWidget {
  final FocusNode passFocus;
  const InputPasswordWidget({super.key, required this.passFocus});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginStates>(
      buildWhen: (previous, current) => current.password != previous.password,
      builder: (context, state) {
        // print('Pass build');

        return TextFormField(
          //controller: loginViewModel.passController.value,
          //obscureText: loginViewModel.visibilityToggle.value,
          focusNode: passFocus,
          decoration: InputDecoration(
            hintText: 'Password',
            prefixIcon: const Icon(Icons.lock_outline),
            suffixIcon: GestureDetector(
              onTap: () {},
              child: const Icon(
                  //loginViewModel.visibilityToggle.value
                  //?
                  Icons.visibility_off
                  // : Icons.visibility,
                  ),
            ),
            label: const Text('Password'),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
          ),
          onChanged: (value) {
            context.read<LoginBloc>().add(PasswordChange(password: value));
          },
          validator: (value) {
            if (value.toString().isEmpty) {
              return 'Password required';
            } else {
              return null;
            }
          },
        );
      },
    );
  }
}
