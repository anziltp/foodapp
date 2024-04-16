import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/core/Provider/provider.dart';
import 'package:foodapp/feature/users%20streem/repositry/streem_repositry.dart';

import '../../../models/users_Streem_model.dart';


final userControllerRepository=Provider((ref) => UserController(repository: ref.watch(userDataRepository)));
final userStream=StreamProvider((ref) => ref.watch(userControllerRepository).userDetails());
class UserController{
  final UserRepository _repository;
  UserController({required UserRepository repository}):_repository=repository;
  Stream userDetails(){
    return _repository.usersData();
  }
  deleteUsers(String id){
    _repository.deleteUser(id);
  }
  blockuser(String id,UserStreemModel userStreemModel){
    _repository.blockUser(id, userStreemModel);
  }


}