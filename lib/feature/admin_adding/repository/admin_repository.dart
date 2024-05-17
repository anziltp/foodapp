import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/home_page.dart';
import 'package:foodapp/models/admin_model.dart';

import '../../../core/Provider/provider.dart';
import '../../adding_banner/repository/banner_repository.dart';

final adminRepositoryProvider=Provider((ref) =>AdminRepository(firestore: ref.watch(firestoreprovider)));
class AdminRepository {
  final FirebaseFirestore _firestore;

  AdminRepository({required FirebaseFirestore firestore })
      :_firestore=firestore;

  CollectionReference get _admins => _firestore.collection("Admins");
  streamingData(){
    return _admins.snapshots().map((event) => event.docs.map((e) => AdminModel.fromMap(e.data() as Map<String,dynamic>)).toList());
  }

  admin(email,password,role,id){
    AdminModel adminModel=AdminModel( email: email, name: password,role: role, id: id);
    _admins.add(adminModel.toMap()).then((value){
      value.update(adminModel.copyWith(id: value.id).toMap());
    });
}}