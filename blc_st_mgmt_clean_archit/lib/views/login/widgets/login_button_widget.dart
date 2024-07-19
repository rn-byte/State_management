import 'package:blc_st_mgmt_clean_archit/bloc/login/login_bloc.dart';
import 'package:blc_st_mgmt_clean_archit/utils/enum/enums.dart';
import 'package:blc_st_mgmt_clean_archit/utils/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../config/colors/app_colors.dart';
import '../../../config/components/round_button.dart';

// ignore: must_be_immutable
class LoginButtonWidget extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final formKey;

  const LoginButtonWidget({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginStates>(
      listenWhen: (previous, current) => current.status != previous.status,
      listener: (context, state) {
        if (state.status == Status.error) {
          FlushBarHelper.flushErrorMessage(state.message, context);
        }

        if (state.status == Status.success) {
          FlushBarHelper.flushSuccessMessage('Login Successfull', context);
        }
      },
      child: BlocBuilder<LoginBloc, LoginStates>(
        buildWhen: (previous, current) => current.status != previous.status,
        builder: (context, state) {
          debugPrint('LoginButton');
          return RoundButton(
            width: 250,
            buttonColor: AppColors.primaryButtonColor,
            title: 'Login',
            loading: state.status == Status.loading ? true : false,
            onPress: () {
              if (formKey.currentState!.validate()) {
                context.read<LoginBloc>().add(LoginApi());
              }
            },
          );
        },
      ),
    );
  }
}
