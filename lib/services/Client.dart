import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class Client {
  final HttpClient _httpClient = HttpClient();
  final String url;

  Client({@required this.url}): assert(url != null);

  Future<Response> get(Uri uri) async {
    final request = await _httpClient.getUrl(uri);
    return _executeRequest(request);
  }

  Future<http.Response> getWithHeaders(Uri uri, Map<String, String> headers) =>
      http.get(uri.toString(), headers: headers);

  Future<Response> postJson(Uri uri, Map<String, dynamic> jsonMap) async {
    final request = await _httpClient.postUrl(uri);
    request.headers.set('Content-Type', 'application/json');
    request.add(utf8.encode(json.encode(jsonMap)));

    return _executeRequest(request);
  }

  Future<Response> putJson(Uri uri, Map<String, dynamic> jsonMap) async {
    final request = await _httpClient.putUrl(uri);
    request.headers.set('Content-Type', 'application/json');
    request.add(utf8.encode(json.encode(jsonMap)));

    return _executeRequest(request);
  }

  Future<Response> _executeRequest(HttpClientRequest request) async {
    final response = await request.close();
    final responseBody = await response.transform(utf8.decoder).join();

    return Response(response.statusCode, responseBody);
  }
}

class Response {
  final int statusCode;
  final String body;

  Response(this.statusCode, this.body);
}