import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class BaseClient {
  static const TIME_OUT = 60;
  static const TIME_OUT_FILE = 300;

  get httpClient => null;

}
