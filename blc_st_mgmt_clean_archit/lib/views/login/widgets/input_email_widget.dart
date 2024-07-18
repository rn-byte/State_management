import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputEmailWidget extends StatelessWidget {
  const InputEmailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller: loginViewModel.emailController.value,
      // keyboardType: TextInputType.emailAddress,
      // focusNode: loginViewModel.emailFocus.value,
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
      validator: (value) {
        if (value.toString().isEmpty) {
          return 'Email required';
        } else {
          return null;
        }
      },
    );
  }
}
