// To parse this JSON data, do
//
//     final widgetConfiguration = widgetConfigurationFromJson(jsonString);

import 'dart:convert';

WidgetConfiguration widgetConfigurationFromJson(String str) => WidgetConfiguration.fromJson(json.decode(str));

String widgetConfigurationToJson(WidgetConfiguration data) => json.encode(data.toJson());

class WidgetConfiguration {
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
  int? id;
  String? businessName;
  dynamic archived;
  String? lastModified;
  String? dateCreated;
  dynamic business;
  String? businessNumbers;

  WidgetConfiguration({
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
    this.id,
    this.businessName,
    this.archived,
    this.lastModified,
    this.dateCreated,
    this.business,
    this.businessNumbers,
  });

  factory WidgetConfiguration.fromJson(Map<String, dynamic> json) => WidgetConfiguration(
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
    id: json["id"],
    businessName: json["business_name"],
    archived: json["archived"],
    lastModified: json["last_modified"],
    dateCreated: json["date_created"],
    business: json["business"],
    businessNumbers: json["business_numbers"],
  );

  Map<String, dynamic> toJson() => {
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
    "id": id,
    "business_name": businessName,
    "archived": archived,
    "last_modified": lastModified,
    "date_created": dateCreated,
    "business": business,
    "business_numbers": businessNumbers,
  };
}
