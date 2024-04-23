class AdminModel {
  String email;
  String password;
  String role;
  String id;

  AdminModel(
      { required this.email, required this.password,required this.role,required this.id});

  Map<String, dynamic> toMap() {
    return { "email": this.email, "password": this.password,"role":this.role,"id":this.id};
  }

  factory AdminModel.fromMap(Map<String, dynamic> map) {
    return AdminModel(

      email: map["email"] ?? "",
      password: map["password"] ?? "",
      role: map["role"] ?? "",
      id: map["id"] ?? "",
    );
  }

  AdminModel copyWith({ String? email, String? password, String?role, String?id}) {
    return AdminModel(

        email: email?? this.email,
        password: password ?? this.password,
      role: role?? this.role,
      id: id?? this.id
    );

  }
}