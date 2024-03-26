class Usermodel{
  String name;
  String price;

  Usermodel({
    required this.name,
    required this.price,

  });
  Map<String,dynamic> toMap() {
    return {
      "name": name,
      "password": price,


    };
  }
  factory Usermodel.fromMap(Map<String,dynamic>map){
    return Usermodel(name: map['name']??'',
      price: map['price']??'',);
  }
  Usermodel copywith({
    String? name,
    String? price,

  }){
    return Usermodel(
        name: name??this.name,
        price: price??this.price, );
  }
}