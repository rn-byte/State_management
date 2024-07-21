import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:blc_st_mgmt_clean_archit/data/exceptions/app_exceptions.dart';
import 'package:blc_st_mgmt_clean_archit/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices implements BaseApiService {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic jsonResponse;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      jsonResponse = returnResponse(response);
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    } on TimeoutException {
      throw RequestTimeout();
    }
    return jsonResponse;
  }

  @override
  Future<dynamic> postApi(String url, var data) async {
    dynamic jsonResponse;
    try {
      final response = await http
          .post(
            Uri.parse(url),
            body: data,
          )
          .timeout(const Duration(seconds: 10));
      jsonResponse = returnResponse(response);
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw RequestTimeout();
    }
    return jsonResponse;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 401:
        throw UnauthorizedException();
      case 500:
        throw FetchDataException(
            'Error while communicating with Server : Status code => ${response.statusCode}');
    }
  }
}
