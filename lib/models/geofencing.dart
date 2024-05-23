class Geofencing {
  String? public_key;

  Geofencing({
    this.public_key
  });

  factory Geofencing.fromJson(Map<String, dynamic> json) => Geofencing(
    public_key: json["public_key"],

  );

  Map<String, dynamic> toJson() => {
    "public_key": public_key,
  };
}
