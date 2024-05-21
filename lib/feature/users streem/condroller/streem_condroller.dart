import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/core/Provider/provider.dart';
import 'package:foodapp/feature/users%20streem/repositry/streem_repositry.dart';
import '../../../models/users_Streem_model.dart';


final userControllerRepository=Provider((ref) => UserController(repository: ref.watch(userDataRepository)));
final userStream=StreamProvider((ref) => ref.watch(userControllerRepository).userDetails());

final streamUsers=StreamProvider.autoDispose.family((ref ,String search)=>ref.watch(userControllerRepository).searchUser(search: search));

 final blockuserStream=StreamProvider((ref) => ref.watch(userControllerRepository).blockuserDetails());
class UserController{
  final UserRepository _repository;
  UserController({required UserRepository repository}):_repository=repository;
  Stream userDetails(){
    return _repository.usersData();
  }
  Stream<List<UserStreemModel>>searchUser({required String search}){
    return _repository.searchUser(search);
  }
  
  Stream blockuserDetails(){
    return _repository.blockuserview();
  }
  deleteUsers(String id){
    _repository.deleteUser(id);
  }
  blockuser(String id,UserStreemModel userStreemModel){
    _repository.blockUser(id, userStreemModel);
  }
  unblockuser(String id,UserStreemModel userStreemModel){
    _repository.unblockUser(id, userStreemModel);
  }


}