// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url}) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
        'there is problem with states code${response.statusCode}',
      );
    }
  }

  Future<dynamic> post({
    required String url,
    required dynamic body,
    @required String? token,
  }) async {
    Map<String, String> haeders = {};
    if (token != null) {
      haeders.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: haeders,
    );
    print(response.body);
    return jsonDecode(response.body);
  }

  Future<dynamic> put({
    required String url,
    required dynamic body,
    @required String? token,
  }) async {
    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    http.Response response = await http.put(
      Uri.parse(url),
      body: body,
      headers: headers,
    );

    print('PUT response: ${response.body}');
    return jsonDecode(response.body);
  }
}
