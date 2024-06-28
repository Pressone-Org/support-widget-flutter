// To parse this JSON data, do
//
//     final feedbackModel = feedbackModelFromJson(jsonString);

import 'dart:convert';

FeedbackModel feedbackModelFromJson(String str) => FeedbackModel.fromJson(json.decode(str));

String feedbackModelToJson(FeedbackModel data) => json.encode(data.toJson());

class FeedbackModel {
  String? category;
  dynamic name;
  dynamic email;
  dynamic message;
  dynamic rating;
  dynamic mobile;

  FeedbackModel({
    this.category,
    this.name,
    this.email,
    this.message,
    this.rating,
    this.mobile,
  });

  factory FeedbackModel.fromJson(Map<String, dynamic> json) => FeedbackModel(
    category: json["category"],
    name: json["name"],
    email: json["email"],
    message: json["message"],
    rating: json["rating"],
    mobile: json["mobile"],
  );

  Map<String, dynamic> toJson() => {
    "category": category,
    "name": name,
    "email": email,
    "message": message,
    "rating": rating,
    "mobile": mobile,
  };
}
