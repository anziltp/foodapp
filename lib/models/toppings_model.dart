class ToppingsModel {
  String category;
  String name;
  String image;
  String id;
  String categoryId;
  List search;

  ToppingsModel(
      {required this.category,required this.name, required this.image, required this.id,required this.categoryId,required this.search,});

  Map<String, dynamic> toMap() {
    return {"category": this.category,"name": this.name, "image": this.image, "id": this.id, "categoryid": this.categoryId ,"search": this.search};
  }

  factory ToppingsModel.fromMap(Map<String, dynamic> map) {
    return ToppingsModel(
      category: map["category"] ?? "",
      name: map["name"]??"",
      image: map["image"] ?? "",
      id: map["id"] ?? "",
      categoryId: map["categoryId"] ?? "",
      search: map["search"] ?? [],
    );
  }

  ToppingsModel copyWith({String? category, String? name, String? image, String? id, String? categoryId,List? search}) {
    return ToppingsModel(
        category: category ?? this.category,
        name: name ?? this.name,
        image: image ?? this.image,
        id: id ?? this.id,
        categoryId: categoryId ?? this.categoryId,
        search: search ?? this.search
    );
  }
}