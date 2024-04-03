class Usermodel{
  String name;
  String price;
  List favourite;

  Usermodel({
    required this.name,
    required this.price,
    required this.favourite

  });
  Map<String,dynamic> toMap() {
    return {
      "name": name,
      "password": price,
      "favourite":favourite


    };
  }
  factory Usermodel.fromMap(Map<String,dynamic>map){
    return Usermodel(name: map['name']??'',
      price: map['price']??'',
      favourite: map["favourite"]??""
    );
  }
  Usermodel copywith({
    String? name,
    String? price,
    List? favourite

  }){
    return Usermodel(
        name: name??this.name,
        price: price??this.price,
      favourite: favourite??this.favourite
    );
  }
}