class ClothesModel {
  String id;
  String type;
  String url;

  ClothesModel({required this.id, required this.type, required this.url});

  factory ClothesModel.fromJson(Map<String, dynamic> json) {
    return ClothesModel(
      id: json['_id'],
      type: json['type'],
      url: json['url'],
    );
  }
}