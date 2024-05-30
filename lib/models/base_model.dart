abstract class BaseModel {
  /// Note: For non freezed Models extending this should have a fromJson function,

  Map<String, dynamic> toJson();
}
