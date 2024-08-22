import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class CalendarConnection {
  static CalendarConnection? _connection;


  static CalendarConnection get instance {
    _connection ??= CalendarConnection._();
    return _connection!;
  }

  CalendarConnection._();

  final Map<String, String> _headers = {"Content-Type": "application/json"};

  // GET
  Future<http.Response> get(String uri) {
    return http.get(
      _createUri(uri),
      headers: _headers,
    ).then((res) {
      return res;
    });
  }

  // POST
  Future<http.Response> post(String uri, {String? data}) {
    return http.post(
      _createUri(uri),
      body: data,
      headers: _headers,
    ).then((res) {
      return res;
    });
  }

  // DELETE
  Future<http.Response> delete(String uri, {String? data}) {
    return http.delete(
      _createUri(uri),
      body: data,
      headers: _headers,
    ).then((res) {
      return res;
    });
  }

  // PATCH
  Future<http.Response> patch(String uri, {String? data}) {
    return http.patch(
      _createUri(uri),
      body: data,
      headers: _headers,
    ).then((res) {
      return res;
    });
  }

  // PUT
  Future<http.Response> put(String uri, {String? data}) {
    return http.put(
      _createUri(uri),
      body: data,
      headers: _headers,
    ).then((res) {
      return res;
    });
  }

  // JSON Decoding
  Map<String, dynamic> getJsonMapOrCrash(String body, {String? key}) {
    final json = jsonDecode(body) as Map<String, dynamic>;
    if (key != null) {
      return json[key] as Map<String, dynamic>;
    } else {
      return json;
    }
  }

  // JSON LIST Decoding
  Iterable getIterableOrCrash(String body) {
    final json = (jsonDecode(body) as Map<String, dynamic>) as Iterable;
    return json;
  }

  // request 보낼 주소 생성
  Uri _createUri(String path) {
    return Uri.parse("https://dummyjson.com$path");
  }
}