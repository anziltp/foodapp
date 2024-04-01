class CategoryModel {
  String category;
  String image;
  String id;

  CategoryModel(
      {required this.category, required this.image, required this.id});

  Map<String, dynamic> toMap() {
    return {"category": this.category, "image": this.image, "id": this.id};
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      category: map["category"] ?? "",
      image: map["image"] ?? "",
      id: map["id"] ?? "",
    );
  }

  CategoryModel copyWith({String? category, String? image, String? id}) {
    return CategoryModel(
        category: category ?? this.category,
        image: image ?? this.image,
        id: id ?? this.id);
  }
}
