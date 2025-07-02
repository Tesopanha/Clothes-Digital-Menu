class BrandModel {
  final String id;
  final String name;
  final String logoURL;

  BrandModel({
    required this.id,
    required this.name,
    required this.logoURL,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['_id'],
      name: json['name'],
      logoURL: json['logoURL'],
    );
  }
}
