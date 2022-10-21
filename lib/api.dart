import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ServiceApi {

  ServiceApi._();

  static Map decodedResponse(http.Response responseResult) =>
      jsonDecode(responseResult.body) as Map;

  static Future<Map?> info() async {

    var client = http.Client();
    try{
      String baseURL = 'https://sa-day1.iranianpooshesh.com';
      Uri apiuri = Uri.parse('$baseURL'
          '/api/app/Dey_agent/requests_list/?tab=issuance');
      var response = await client.get(
        apiuri,
        headers: {
          HttpHeaders.authorizationHeader:
          'jwt eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjY2ODUzNjY1LCJqdGkiOiIxMjYxYzljNWU2ODE0Yjk1OTMwMWE3NTcwY2ZlODhhOSIsInVzZXJfaWQiOjgyfQ.pKAAY06Ai5ep2RktLNB1Ho8V594rXUZG9LqkUoyoqbU',
        },
      );
      return decodedResponse(response);
    }
    catch(e){
      print('HTTP Response error : $e');
      return null;
    }
  }

}