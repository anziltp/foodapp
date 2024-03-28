class CategoryModel {
  String category;
  String image;

  CategoryModel({required this.category, required this.image});

  Map<String, dynamic> toMap() {
    return {"category": this.category, "image": this.image};
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      category: map["category"] ?? "",
      image: map["image"] ?? "",
    );
  }

  CategoryModel copyWith({String? category, String? image}) {
    return CategoryModel(
        category: category ?? this.category, image: image ?? this.image);
  }
}
