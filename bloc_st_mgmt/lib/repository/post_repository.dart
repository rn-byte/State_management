import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc_st_mgmt/models/post_model/post_model.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  Future<List<PostModel>> fetchPost() async {
    try {
      final response = await http.post(
          Uri.parse('https://jsonplaceholder.typicode.com/posts/1/comments'));
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body) as List;
        return body.map((e) {
          return PostModel(
            postId: e['postId'],
            id: e['id'],
            name: e['name'],
            email: e['email'],
            body: e['body'],
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
    throw Exception('Error Fetching Data');
  }
}
