class streemmodel{
  String name;
  String email;
  String password;
  String number;
  String image;



  streemmodel({
    required this.name,
    required this.email,
    required this.password,
    required this.number

  });
  Map<String,dynamic> toMap() {
    return {
      "name": name,
      "password": price,


    };
  }
  factory streemmodel.fromMap(Map<String,dynamic>map){
    return streemmodel(name: map['name']??'',
      price: map['price']??'',);
  }
  streemmodel copywith({
    String? name,
    String? price,

  }){
    return streemmodel(
      name: name??this.name,
      price: price??this.price, );
  }
}