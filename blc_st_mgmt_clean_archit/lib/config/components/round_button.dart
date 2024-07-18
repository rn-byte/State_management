import 'package:blc_st_mgmt_clean_archit/config/colors/app_colors.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final bool loading;
  final String title;
  final double height, width;
  final VoidCallback onPress;
  final Color textColor, buttonColor;
  const RoundButton({
    super.key,
    this.buttonColor = AppColors.primaryButtonColor,
    this.textColor = AppColors.primaryTextColor,
    required this.title,
    required this.onPress,
    this.width = 60,
    this.height = 50,
    this.loading = false,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: loading
            ? const Center(child: CircularProgressIndicator())
            : Center(
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                ),
              ), // Center
      ),
    ); // Container
  }
}
