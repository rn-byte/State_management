import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bloc_st_mgmt/models/post_model/post_model.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  Future<List<PostModel>> fetchPost() async {
    try {
      final response = await http.get(
          Uri.parse('https://jsonplaceholder.typicode.com/posts/1/comments'));
      // print(response.statusCode);
      // print(response.body);
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body) as List;
        return body.map((e) {
          return PostModel(
            postId: e['postId'] as int,
            id: e['id'] as int,
            name: e['name'] as String,
            email: e['email'] as String,
            body: e['body'] as String,
          );
        }).toList();
      }
    } on SocketException {
      throw 'No Internet Connection';
    } on TimeoutException {
      throw 'Timeout';
    } catch (e) {
      throw e.toString();
    }
    throw 'Error Fetching Data';
  }
}
