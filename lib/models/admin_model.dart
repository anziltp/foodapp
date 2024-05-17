class AdminModel {
  String email;
  String name;
  String role;
  String id;

  AdminModel(
      { required this.email, required this.name,required this.role,required this.id});

  Map<String, dynamic> toMap() {
    return { "email": this.email, "password": this.name,"role":this.role,"id":this.id};
  }

  factory AdminModel.fromMap(Map<String, dynamic> map) {
    return AdminModel(

      email: map["email"] ?? "",
      name: map["name"] ?? "",
      role: map["role"] ?? "",
      id: map["id"] ?? "",
    );
  }

  AdminModel copyWith({ String? email, String? name, String?role, String?id}) {
    return AdminModel(

        email: email?? this.email,
        name: name ?? this.name,
      role: role?? this.role,
      id: id?? this.id
    );

  }
}