import 'package:blc_st_mgmt_clean_archit/bloc/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class InputEmailWidget extends StatelessWidget {
  final FocusNode emailFocus;
  const InputEmailWidget({super.key, required this.emailFocus});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginStates>(
      buildWhen: (previous, current) => current.email != previous.email,
      builder: (context, state) {
        // print('Email Build');
        return TextFormField(
          // controller: loginViewModel.emailController.value,
          keyboardType: TextInputType.emailAddress,
          focusNode: emailFocus,
          onFieldSubmitted: (value) {},
          decoration: const InputDecoration(
            hintText: 'Email',
            prefixIcon: Icon(Icons.person_3_outlined),
            label: Text('Email'),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
          ),
          onChanged: (value) {
            context.read<LoginBloc>().add(EmailChanged(email: value));
          },
          validator: (value) {
            if (value.toString().isEmpty) {
              return 'Email required';
            }
            // if (!Validations.emailValidator(value!)) {
            //   return 'Invalid Email';
            // }
            else {
              return null;
            }
          },
        );
      },
    );
  }
}
