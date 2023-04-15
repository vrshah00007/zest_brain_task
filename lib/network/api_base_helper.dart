import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:zest_brain_task/constants/global_variable.dart';

import 'app_exception.dart';

class ApiBaseHelper {
  final String _baseUrl = "http://hexeros.com/dev/finowise/api/V1/";

  Future<dynamic> get(String url) async {
    var responseJson;
    var headers = {'vAuthorization': 'Bearer $token'};
    try {
      final response = await http.get(
        Uri.parse(_baseUrl + url),
        headers: headers,
      );

      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic body, {bool? tokenSend}) async {
    var responseJson;
    try {
      var headers = {'vAuthorization': 'Bearer $token'};
      final response = await http.post(Uri.parse(_baseUrl + url),
          body: body,
          headers: (tokenSend != null && tokenSend) ? headers : null);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
