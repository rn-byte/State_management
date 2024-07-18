import 'dart:async';

import 'package:blc_st_mgmt_clean_archit/config/routes/routes_name.dart';
import 'package:flutter/material.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    Timer(
      const Duration(seconds: 4),
      () => Navigator.pushNamedAndRemoveUntil(
          context, RoutesName.loginScreen, (route) => false),
    );
  }
}
