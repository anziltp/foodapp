class BannerModel {

  String image;
  String id;

  BannerModel(
      { required this.image, required this.id});

  Map<String, dynamic> toMap() {
    return { "image": this.image, "id": this.id};
  }

  factory BannerModel.fromMap(Map<String, dynamic> map) {
    return BannerModel(

      image: map["image"] ?? "",
      id: map["id"] ?? "",
    );
  }

  BannerModel copyWith({ String? image, String? id}) {
    return BannerModel(

        image: image ?? this.image,
        id: id ?? this.id);
  }
}
