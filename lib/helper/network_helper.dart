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

  Dio _dioClient = Dio(
    BaseOptions(
      connectTimeout: 100000,
    ),
  );

  // static const String BASE_URL = AppConfig.baseURL;

  Future<dynamic> postHttp(String url, dynamic body,
      {Map<String, String>? header}) async {
    final client = http.Client();
    try {
      final String fullURL = "https://pressone-test-252281de-ddc2cd5e9c01.herokuapp.com/api/" + url;
      print(fullURL);
      final response =
          await client.post(Uri.parse(fullURL), body: body, headers: header);
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
      final String fullURL = "https://api.pressone.co/" + url;
      final response = await client.patch(
        Uri.parse(fullURL),
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
      final String fullURL = "https://pressone-test-252281de-ddc2cd5e9c01.herokuapp.com/api/" + url;
      print(fullURL);
      final response = await client.get(
        Uri.parse(fullURL),
        headers: header,
      );
      print("response: $response");

      return checkResponse(response);
    } catch (e) {
      client.close();
      rethrow;
    }
  }

  Future<dynamic> deleteHttp(String url,
      {required Map<String, String> header, bool isToken = true}) async {
    final client = http.Client();
    try {
      final String fullURL = "https://api.pressone.co/" + url;

      var request = http.Request('DELETE', Uri.parse(fullURL));

      request.headers.addAll(header);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 400) {
        throw ("Something is wrong");
      } else {
        return await response.stream.bytesToString();
      }
    } catch (e) {
      client.close();
      rethrow;
    }
  }

  Future<dynamic> postExternal(String url, dynamic body,
      {Map<String, String>? header}) async {
    final client = http.Client();
    try {
      final response =
      await client.post(Uri.parse(url), body: body, headers: header);
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
              // "error code --> ${response.statusCode} ==> ${response.body.toString()}";
            }
            // final Map<String, dynamic> data = jsonDecode(response.body);
            print("error: ${response.statusCode}");
            // throw AppException(
            //     message: message, errorCode: response.statusCode);
          } catch (e) {
            rethrow;
          }
      }
    } catch (e) {
      rethrow;
    }
  }
}
