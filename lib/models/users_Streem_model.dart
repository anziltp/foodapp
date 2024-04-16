class UserStreemModel{
  String name;
  String email;
  String password;
  String image;
  String id;
  bool status;

  UserStreemModel({
    required this.name,
    required this.email,
    required this.password,
    required this.image,
    required this.id,
    required this.status,

  });
  Map<String,dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "image":image,
      "id":id,
      "status":status,

    };
  }
  factory UserStreemModel.fromMap(Map<String,dynamic>map){
    return UserStreemModel(name: map['name']??'',
      email: map['email']??'',
      password: map['password']??'',
      image: map['image']??'',
      id: map['id']??'',
      status: map['status']??'',

    );
  }
  UserStreemModel copywith({
    String? name,
    String? email,
    String? password,
    String? image,
    String? id,
     bool? status,

  }){
    return UserStreemModel(
      name: name??this.name,
      email: email??this.email,
      password: password??this.password,
      image: image??this.image,
      id: id??this.id,
      status:status??this.status

    );
  }
}
