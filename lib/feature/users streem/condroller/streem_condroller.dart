import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/core/Provider/provider.dart';
import 'package:foodapp/feature/users%20streem/repositry/streem_repositry.dart';
import '../../../models/users_Streem_model.dart';


final userControllerRepository=Provider((ref) => UserController(repository: ref.watch(userDataRepository)));

final streamUsers=StreamProvider.autoDispose.family((ref ,String search)=>ref.watch(userControllerRepository).searchUser(search: search));
final streamBlockUsers=StreamProvider.autoDispose.family((ref ,String search)=>ref.watch(userControllerRepository).searchBlockUser(search: search));

class UserController{
  final UserRepository _repository;
  UserController({required UserRepository repository}):_repository=repository;

  Stream<List<UserStreemModel>>searchUser({required String search}){
    return _repository.searchUser(search);
  }
  Stream<List<UserStreemModel>>searchBlockUser({required String search}){
    return _repository.searchBlockUser(search);
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