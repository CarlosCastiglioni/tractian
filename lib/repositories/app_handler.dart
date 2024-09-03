import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:tractian/repositories/base_url.dart';

class AppHandler {
  final String urlPath;

  AppHandler({required this.urlPath});

  Future get([Map<String, dynamic>? queryParameters]) async {
    Map<String, String>? queryParams =
        queryParameters?.map((key, value) => MapEntry(key, value.toString()));
    Uri uri = Uri.https(baseUrl, urlPath, queryParams);
    final response = await http.get(uri, headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    });
    final result = handler(response);
    return result;
  }

  handler(Response response) {
    switch (response.statusCode) {
      case 200:
        return _handle200(response);
      case 201:
        return _handle201(response);
      case 400:
        return _handle400(response);
      case 401:
        return _handle401(response);
      case 403:
        return _handle403(response);
      case 404:
        return _handle404(response);
      case 422:
        return _handle422(response);
      case 500:
        return _handle500(response);
      default:
        return 'Unknown status code: ${response.statusCode}';
    }
  }

  _handle200(http.Response response) {
    final data = json.decode(response.body);
    return data;
  }

  _handle201(http.Response response) {
    final data = json.decode(response.body);
    return data;
  }

  _handle400(http.Response response) {
    json.decode(response.body);
  }

  _handle401(http.Response response) {
    json.decode(response.body);
  }

  _handle403(http.Response response) {
    json.decode(response.body);
  }

  _handle404(http.Response response) {
    json.decode(response.body);
  }

  void _handle422(http.Response response) {
    final data = json.decode(response.body);
    final errors = data['errors'] as Map<String, dynamic>;
    errors.entries.map((entry) {
      final messages = entry.value as List;
      return messages.join('\n');
    }).join('\n');
  }

  _handle500(http.Response response) {
    json.decode(response.body);
  }
}
