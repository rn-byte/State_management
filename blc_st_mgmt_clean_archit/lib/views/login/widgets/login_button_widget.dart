import 'package:flutter/material.dart';
import '../../../config/colors/app_colors.dart';
import '../../../config/components/round_button.dart';

// ignore: must_be_immutable
class LoginButtonWidget extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final formKey;

  const LoginButtonWidget({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return RoundButton(
      width: 250,
      buttonColor: AppColors.primaryButtonColor,
      title: 'Login',
      onPress: () {
        if (formKey.currentState!.validate()) {}
      },
    );
  }
}
