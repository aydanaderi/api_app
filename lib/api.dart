import 'dart:io';

import 'package:http/http.dart' as http;
import 'config.dart';
import 'dart:convert';

class ServiceApi {
  ServiceApi._();

  static Map decodedResponse(http.Response responseResult) =>
      jsonDecode(responseResult.body) as Map;

  static Future<Map?> info() async {
    var client = http.Client();
    try {
      var response = await client.get(
          ServiceConfig.apiuri,
        headers: {
          HttpHeaders.authorizationHeader: 'jwt eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjY2ODUzNjY1LCJqdGkiOiIxMjYxYzljNWU2ODE0Yjk1OTMwMWE3NTcwY2ZlODhhOSIsInVzZXJfaWQiOjgyfQ.pKAAY06Ai5ep2RktLNB1Ho8V594rXUZG9LqkUoyoqbU',
        },
      );
      return decodedResponse(response);
    }
    catch (e) {
      print('HTTP Response error : $e');
      return null;
    }
  }

}