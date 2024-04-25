class ToppingsModel {
  String category;
  String name;
  String image;
  String id;

  ToppingsModel(
      {required this.category,required this.name, required this.image, required this.id,});

  Map<String, dynamic> toMap() {
    return {"category": this.category,"name": this.name, "image": this.image, "id": this.id};
  }

  factory ToppingsModel.fromMap(Map<String, dynamic> map) {
    return ToppingsModel(
      category: map["category"] ?? "",
      name: map["name"]??"",
      image: map["image"] ?? "",
      id: map["id"] ?? "",
    );
  }

  ToppingsModel copyWith({String? category, String? name, String? image, String? id}) {
    return ToppingsModel(
        category: category ?? this.category,
        name: name ?? this.name,
        image: image ?? this.image,
        id: id ?? this.id);
  }
}