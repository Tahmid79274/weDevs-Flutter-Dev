import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class BaseClient {
  static const TIME_OUT = 60;

  get httpClient => null;

  static Future<List<dynamic>?> postFunction(String urlLink,Map<String, String> body,Map<String, String> header)async{
    // final Uri url = Uri.parse(ServiceApi.loginEndPoint);
    final Uri url = Uri.parse(urlLink);
    //print('Url:$url');
    // final Map<String, String> body = {'username': emailController.text, 'password': passwordController.text};

    try {
      final response = await http.post(url, body: body, headers: header).timeout(Duration(seconds: TIME_OUT));

      return [response.statusCode,response.body];
    } catch (error) {
      // Handle exceptions (e.g., network issues)
      print('Login error: $error');
    }
    return null;
  }
}