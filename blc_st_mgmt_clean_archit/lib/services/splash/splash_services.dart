import 'dart:async';

import 'package:blc_st_mgmt_clean_archit/config/routes/routes_name.dart';
import 'package:blc_st_mgmt_clean_archit/services/session_manager/session_controller.dart';
import 'package:flutter/material.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    debugPrint(SessionController().isLogin.toString());
    SessionController().getUserFromPreference().then((value) {
      if (SessionController().isLogin ?? false) {
        Timer(
          const Duration(seconds: 2),
          () => Navigator.pushNamedAndRemoveUntil(
              context, RoutesName.homeScreen, (route) => false),
        );
      } else {
        Timer(
          const Duration(seconds: 2),
          () => Navigator.pushNamedAndRemoveUntil(
              context, RoutesName.loginScreen, (route) => false),
        );
      }
    }).onError((error, stackTrae) {
      debugPrint(error.toString());
      Timer(
        const Duration(seconds: 2),
        () => Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.loginScreen, (route) => false),
      );
    });
  }
}
