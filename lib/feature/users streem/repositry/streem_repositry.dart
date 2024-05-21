
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/core/Provider/provider.dart';
import 'package:foodapp/models/users_Streem_model.dart';


final userDataRepository=Provider((ref) => UserRepository(firestore: ref.watch(firestoreprovider)));
class UserRepository{

  final FirebaseFirestore _firestore;
  UserRepository({required FirebaseFirestore firestore}):_firestore=firestore;
  CollectionReference get _userdata=>_firestore.collection("Users");


  usersData(){
    return _userdata.where("status",isEqualTo: false).snapshots().map((event) => event.docs.map((e) => UserStreemModel.fromMap(e.data() as Map<String,dynamic>)).toList());
  }

  blockuserview(){
    return _userdata.where("status",isEqualTo: true).snapshots().map((event) => event.docs.map((e) => UserStreemModel.fromMap(e.data() as Map<String,dynamic>)).toList());
  }
deleteUser(String id){
  _userdata.doc(id).delete();
}
blockUser(String id,UserStreemModel userStreemModel){
_userdata.doc(id).update(
  userStreemModel.copywith(
    status: true
  ).toMap()
);
}
unblockUser(String id,UserStreemModel userStreemModel){
_userdata.doc(id).update(
  userStreemModel.copywith(
    status: false
  ).toMap()
);
}
}