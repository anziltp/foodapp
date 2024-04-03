class StreemModel{
  String name;
  String email;
  String password;
  String image;



  StreemModel({
    required this.name,
    required this.email,
    required this.password,
    required this.image,

  });
  Map<String,dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "image":image,


    };
  }
  factory StreemModel.fromMap(Map<String,dynamic>map){
    return StreemModel(name: map['name']??'',
      email: map['email']??'',
      password: map['password']??'',
      image: map['image']??'',
    );
  }
  StreemModel copywith({
    String? name,
    String? email,
    String? password,
    String? image,

  }){
    return StreemModel(
      name: name??this.name,
      email: email??this.email,
      password: password??this.password,
      image: image??this.image,

    );
  }
}
