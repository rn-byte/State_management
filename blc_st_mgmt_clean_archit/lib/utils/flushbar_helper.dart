import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:blc_st_mgmt_clean_archit/config/colors/app_colors.dart';
import 'package:flutter/material.dart';

class FlushBarHelper {
  static void flushErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        duration: const Duration(seconds: 2),
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(15),
        message: message,
        borderRadius: BorderRadius.circular(20),
        backgroundColor: AppColors.redColor,
        icon: const Icon(Icons.error),
      )..show(context),
    );
  }

  static void flushSuccessMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        duration: const Duration(seconds: 2),
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(15),
        message: message,
        borderRadius: BorderRadius.circular(20),
      )..show(context),
    );
  }
}
