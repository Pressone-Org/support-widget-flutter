import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:live_call_widget_flutter/helper/logger.dart';

class NetworkAPICall {
  String token = "";
  NetworkAPICall(){}

  void getToken(String tokenFromARM){
    token = tokenFromARM;
  }

  NetworkAPICall._internal();

  static const String baseUrl = "https://api.pressone.co/api/";

  Future<dynamic> postHttp(String url, dynamic body,
      {Map<String, String>? header}) async {
    final client = http.Client();
    try {
      final String fullUrl = baseUrl + url;
      print(fullUrl);
      final response =
          await client.post(Uri.parse(fullUrl), body: body, headers: header);
      return checkResponse(response);
    } catch (e) {
      client.close();
      rethrow;
    }
  }

  Future<dynamic> patchHttp(String url, dynamic body,
      {Map<String, String>? header}) async {
    final client = http.Client();
    try {
      final String fullUrl = baseUrl + url;
      final response = await client.patch(
        Uri.parse(fullUrl),
        body: body,
        headers: header,
        encoding: Encoding.getByName("utf-8"),
      );
      //logger.d('URL: $fullURL \n Response body: ${response.body}');
      return checkResponse(response);
    } catch (e, st) {
      logger.e('$e: \n $st');
      client.close();
      rethrow;
    }
  }

  Future<dynamic> getHttp(String url,
      {Map<String, String>? header, bool isToken = true}) async {
    final client = http.Client();
    try {
      final String fullUrl = baseUrl + url;
      print(fullUrl);
      final response = await client.get(
        Uri.parse(fullUrl),
        headers: header,
      );
      print("response: $response");

      return checkResponse(response);
    } catch (e) {
      client.close();
      rethrow;
    }
  }

  dynamic checkResponse(http.Response response) {
    try {
      switch (response.statusCode) {
        case 200:
        case 201:
          try {
            if (response.body.isEmpty) {
              return true;
            }
            return jsonDecode(response.body);
          } catch (e) {
            rethrow;
          }
        case 204:
          return {"success": true};
        case 400:
          return jsonDecode(response.body);
        case 500:
          return {"message: Server downtime"};
          // return throw AppException(
          //     message: 'Server downtime', errorCode: response.statusCode);
        case 503:
          return {"message: Server downtime"};
          // return throw AppException(
          //     message: 'Server downtime', errorCode: response.statusCode);
        default:
          try {
            String message;
            if (response.body.isEmpty) {
              message = "${response.statusCode}";
            } else {
              message = response.body.toString();
            }
            print("error: ${response.statusCode}");
          } catch (e) {
            rethrow;
          }
      }
    } catch (e) {
      rethrow;
    }
  }
}
