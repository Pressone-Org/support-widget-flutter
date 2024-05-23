import 'dart:convert';
import 'dart:io';
import 'package:live_call_widget_flutter/helper/logger.dart';
import 'package:live_call_widget_flutter/helper/network_helper.dart';
import 'package:live_call_widget_flutter/models/geofencing.dart';
import 'package:live_call_widget_flutter/models/line.dart';
import 'package:live_call_widget_flutter/models/widget_configuration.dart';
import 'package:live_call_widget_flutter/network/endpoints.dart';

import 'user_web_service.dart';

class UserWebServiceImpl extends UserWebService {
  final NetworkAPICall _networkAPICall = NetworkAPICall();


  @override
  Future<Line> getReceiverLineDetail({required Geofencing geofencing}) async {
    try {
      var body = {
        "public_key": geofencing.public_key,
      };
      print(body);
      var response = await _networkAPICall
          .postHttp(getReceiverLine, jsonEncode(body), header: {
      HttpHeaders.authorizationHeader:
      'Pressone-X-Pub-Key: pk_6UFQK85kbYAObTuUbbcqoXf8Xei3M',
        HttpHeaders.contentTypeHeader: "application/json"
      });

      print("Receiver line detail: ${response.toString()}");
      Line line = Line.fromJson(response);
      return line;
    } catch (e, st) {
      logger.e("Error(getUserByMobile)-->>:$e $st");
      rethrow;
    }
  }

  @override
  Future<WidgetConfiguration> getWidgetConfiguration() async {
    try {
      var response = await _networkAPICall
          .getHttp(getWidgetConfigurationEndpoint, header: {
      HttpHeaders.authorizationHeader:
      'Pressone-X-Pub-Key: pk_6UFQK85kbYAObTuUbbcqoXf8Xei3M',
      "Pressone-Platform": Platform.isIOS ? "ios" : "android"
      });

      print('User data is ${response.toString()}');
      WidgetConfiguration user = WidgetConfiguration.fromJson(response);
      return user;
    } catch (e, st) {
      logger.e("Error(getUserByMobile)-->>:$e $st");

      rethrow;
    }
  }
}
