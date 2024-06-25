class Business {
  String? name;
  dynamic website;

  Business({
    this.name,
    this.website,
  });

  factory Business.fromJson(Map<String, dynamic> json) => Business(
    name: json["name"],
    website: json["website"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "website": website,
  };
}