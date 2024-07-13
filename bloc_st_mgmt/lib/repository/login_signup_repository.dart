import 'package:http/http.dart' as http;

class LoginSignupRepository {
  Future<dynamic> hitLogin(Map data) async {
    try {
      final response = await http.post(
        Uri.parse('https://reqres.in/api/login'),
        body: data,
      );

      print(response.statusCode);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        //print(response.body.toString());

        return response.body;
      }
    } catch (e) {
      //print(e.toString());
      return e.toString();
    }
  }
}
