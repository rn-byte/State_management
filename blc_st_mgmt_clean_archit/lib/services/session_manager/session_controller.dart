import 'dart:convert';

import 'package:blc_st_mgmt_clean_archit/models/user/user_model.dart';
import 'package:flutter/material.dart';

import '../storage/local_storage.dart';

class SessionController {
  static final SessionController _sessionController =
      SessionController._internal();

  LocalStorage localStorage = LocalStorage();
  UserModel user = UserModel();
  bool? isLogin;

//Private constructor helps in preventing the creation of instance of this
//singleton class and also used for implementing singleton pattern
  SessionController._internal() {
    isLogin = false;
  }

//factory constructor is used for returning existing instance of class
  factory SessionController() {
    return _sessionController;
  }

  Future<void> saveUserInPreference(dynamic user) async {
    localStorage.setValue('token', jsonEncode(user));

    //storing value to check login
    localStorage.setValue('isLogin', 'true');
  }

  Future<void> getUserFromPreference() async {
    try {
      var userData = await localStorage.readValue('token');
      var isLogin = await localStorage.readValue('isLogin');

      if (userData.isNotEmpty) {
        SessionController().user = UserModel.fromJson(jsonDecode(userData));
      }
      SessionController().isLogin = isLogin == 'true' ? true : false;

      debugPrint(SessionController().isLogin.toString());
    } catch (e) {
      debugPrint('Data Retriving Error: ${e.toString()}');
    }
  }
}
