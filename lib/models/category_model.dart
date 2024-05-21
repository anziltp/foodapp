class CategoryModel {
  String category;
  String image;
  String id;
  List search;

  CategoryModel(
      {required this.category, required this.image, required this.id,required this.search,});

  Map<String, dynamic> toMap() {
    return {"category": this.category, "image": this.image, "id": this.id,"search": this.search,};
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      category: map["category"] ?? "",
      image: map["image"] ?? "",
      id: map["id"] ?? "",
      search: map["search"] ?? [],

    );
  }

  CategoryModel copyWith({String? category, String? image, String? id,List? search,String? categoryName}) {
    return CategoryModel(
        category: category ?? this.category,
        image: image ?? this.image,
        id: id ?? this.id,
    search: search?? this.search,

    );
  }
}
