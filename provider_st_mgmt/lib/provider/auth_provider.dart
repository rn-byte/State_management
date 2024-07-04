import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool _loading = false;
  bool _toogle = true;

  bool get loading => _loading;
  bool get toogle => _toogle;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setToogle(bool val) {
    _toogle = val;
    notifyListeners();
  }

  void login(String email, String pass) async {
    setLoading(true);
    try {
      var header = {
        'content-type': 'application/json',
      };
      var body = {
        'email': email.toString().trim(),
        'password': pass.toString().trim()
      };

      http.Response response = await http.post(
        Uri.parse('https://reqres.in/api/login'),
        headers: header,
        body: jsonEncode(body),
      );
      debugPrint(response.statusCode.toString());
      debugPrint('Response Body: ${response.body}');
      debugPrint('Response Body: $body');

      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body.toString());
        debugPrint(json['token']);
        if (json['token'] != '') {
          debugPrint("Login Successful");
        } else {
          debugPrint("Login unsuccessful");
        }
      } else {
        debugPrint("Login unsuccessful");
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setLoading(false);
    }
  }
}
