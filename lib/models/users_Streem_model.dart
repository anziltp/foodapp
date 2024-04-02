class StreemModel{
  String name;
  String email;
  String password;
  String number;
  String image;



  StreemModel({
    required this.name,
    required this.email,
    required this.password,
    required this.number,
    required this.image,

  });
  Map<String,dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "number":number,
      "image":image,


    };
  }
  factory StreemModel.fromMap(Map<String,dynamic>map){
    return StreemModel(name: map['name']??'',
      email: map['email']??'',
      password: map['password']??'',
      number: map['number']??'',
      image: map['image']??'',
    );
  }
  StreemModel copywith({
    String? name,
    String? email,
    String? password,
    String? number,
    String? image,

  }){
    return StreemModel(
      name: name??this.name,
      email: email??this.email,
      password: password??this.password,
      number: number??this.number,
      image: image??this.image,

    );
  }
}