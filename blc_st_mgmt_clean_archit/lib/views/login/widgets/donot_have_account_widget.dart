import 'package:flutter/material.dart';

import '../../../config/colors/app_colors.dart';

class DonotHaveAccountWidget extends StatelessWidget {
  const DonotHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Don\'t have an Account ? '),
        GestureDetector(
          onTap: () {},
          child: const Text(
            'Signup',
            style: TextStyle(color: AppColors.primaryButtonColor),
          ),
        ),
      ],
    );
  }
}
