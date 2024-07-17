import 'package:blc_st_mgmt_clean_archit/config/colors/app_colors.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  const RoundButton({super.key, required this.onPress, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 250,
        decoration: const BoxDecoration(
          color: AppColors.primaryButtonColor,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Center(child: Text(title)),
      ),
    );
  }
}
