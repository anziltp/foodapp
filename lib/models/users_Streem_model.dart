class StreemModel{
  String name;
  String email;
  String password;
  String image;
  String id;



  StreemModel({
    required this.name,
    required this.email,
    required this.password,
    required this.image,
    required this.id,

  });
  Map<String,dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "image":image,
      "id":id,


    };
  }
  factory StreemModel.fromMap(Map<String,dynamic>map){
    return StreemModel(name: map['name']??'',
      email: map['email']??'',
      password: map['password']??'',
      image: map['image']??'',
      id: map['id']??'',
    );
  }
  StreemModel copywith({
    String? name,
    String? email,
    String? password,
    String? image,
    String? id,

  }){
    return StreemModel(
      name: name??this.name,
      email: email??this.email,
      password: password??this.password,
      image: image??this.image,
      id: id??this.id
      ,

    );
  }
}
