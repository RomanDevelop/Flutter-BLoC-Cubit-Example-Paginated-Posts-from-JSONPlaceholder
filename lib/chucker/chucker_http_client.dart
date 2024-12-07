import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:http/http.dart' as http;

class HttpClient {
  final http.Client client;

  HttpClient() : client = ChuckerHttpClient(http.Client());

  Future<http.Response> get(String url) async {
    return client.get(Uri.parse(url));
  }

  void dispose() {
    client.close();
  }
}
