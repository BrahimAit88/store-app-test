import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<List<dynamic>> get({
    required String url,
  }) async {
    http.Response response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);

      return data;
    } else {
      throw Exception(
        'there is problem with satats code ${response.statusCode}}',
      );
    }
  }

  Future<dynamic> post({
    required String url,
    @required dynamic body,
    String? token,
  }) async {
    Map<String, String> headers = {};
    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: headers);

    if (token != null) {
      headers.addAll({
        "Authorization": "bearer $token",
      });
    }
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return throw Exception(
        'there is problem with satats code ${response.statusCode} with body ${jsonDecode(response.body)}',
      );
    }
  }

  Future<dynamic> put({
    required String url,
    @required dynamic body,
    String? token,
  }) async {
    Map<String, String> headers = {};
    headers.addAll({
      "Content-Type": "application/x-www-form-urlencoded",
    });
    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: headers);

    print('url = $url, body = $body, token = $token');

    if (token != null) {
      headers.addAll({
        "Authorization": "bearer $token",
      });
    }
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      print(data.toString());

      return data;
    } else {
      throw Exception(
        'there is problem with satats code ${response.statusCode}',
      );
    }
  }
}
