// To parse this JSON data, do
//
//     final widgetConfiguration = widgetConfigurationFromJson(jsonString);

import 'dart:convert';

import 'package:live_call_widget_flutter/models/base_model.dart';
import 'package:live_call_widget_flutter/models/business.dart';

WidgetConfiguration widgetConfigurationFromJson(String str) => WidgetConfiguration.fromJson(json.decode(str));

String widgetConfigurationToJson(WidgetConfiguration data) => json.encode(data.toJson());

class WidgetConfiguration extends BaseModel {
  String? businessName;
  String? businessNumbers;
  int? id;
  DateTime? dateCreated;
  String? logo;
  String? pageMessage;
  String? jumbotron;
  String? toolTipMessage;
  String? buttonMessage;
  String? contacts;
  String? callLine;
  String? secondaryTextColor;
  String? primaryTextColor;
  int? bottomPosition;
  int? rightPosition;
  String? primaryBgColor;
  String? secondaryBgColor;
  bool? isActive;
  String? webhookUrl;
  Business? business;
  int? addonSubscription;
  String? dialGroup;
  String? widgetType;

  WidgetConfiguration({
    this.businessName,
    this.businessNumbers,
    this.id,
    this.dateCreated,
    this.logo,
    this.pageMessage,
    this.jumbotron,
    this.toolTipMessage,
    this.buttonMessage,
    this.contacts,
    this.callLine,
    this.secondaryTextColor,
    this.primaryTextColor,
    this.bottomPosition,
    this.rightPosition,
    this.primaryBgColor,
    this.secondaryBgColor,
    this.isActive,
    this.webhookUrl,
    this.business,
    this.addonSubscription,
    this.dialGroup,
    this.widgetType,
  });

  factory WidgetConfiguration.fromJson(Map<String, dynamic> json) => WidgetConfiguration(
    businessName: json["business_name"],
    businessNumbers: json["business_number"],
    id: json["id"],
    dateCreated: json["date_created"] == null ? null : DateTime.parse(json["date_created"]),
    logo: json["logo"],
    pageMessage: json["page_message"],
    jumbotron: json["jumbotron"],
    toolTipMessage: json["tool_tip_message"],
    buttonMessage: json["button_message"],
    contacts: json["contacts"],
    callLine: json["call_line"],
    secondaryTextColor: json["secondary_text_color"],
    primaryTextColor: json["primary_text_color"],
    bottomPosition: json["bottom_position"],
    rightPosition: json["right_position"],
    primaryBgColor: json["primary_bg_color"],
    secondaryBgColor: json["secondary_bg_color"],
    isActive: json["is_active"],
    webhookUrl: json["webhook_url"],
    business: json["business"] == null ? null : Business.fromJson(json["business"]),
    addonSubscription: json["addon_subscription"],
    dialGroup: json["dial_group"],
    widgetType: json["widget_type"],
  );

  Map<String, dynamic> toJson() => {
    "business_name": businessName,
    "business_number": businessNumbers,
    "id": id,
    "date_created": dateCreated?.toIso8601String(),
    "logo": logo,
    "page_message": pageMessage,
    "jumbotron": jumbotron,
    "tool_tip_message": toolTipMessage,
    "button_message": buttonMessage,
    "contacts": contacts,
    "call_line": callLine,
    "secondary_text_color": secondaryTextColor,
    "primary_text_color": primaryTextColor,
    "bottom_position": bottomPosition,
    "right_position": rightPosition,
    "primary_bg_color": primaryBgColor,
    "secondary_bg_color": secondaryBgColor,
    "is_active": isActive,
    "webhook_url": webhookUrl,
    "business": business?.toJson(),
    "addon_subscription": addonSubscription,
    "dial_group": dialGroup,
    "widget_type": widgetType,
  };
}
