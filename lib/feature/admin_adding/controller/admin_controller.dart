import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/admin_repository.dart';

final adminControllerProvider=Provider((ref) => AdminController(adminRepository: ref.watch(adminRepositoryProvider)));
final streamadmin=StreamProvider((ref) => ref.watch(adminControllerProvider).streamAdminData());

class AdminController {
  final AdminRepository _adminRepository;

  AdminController({required AdminRepository adminRepository})
      :_adminRepository=adminRepository;

  Stream streamAdminData() {
    return _adminRepository.streamingData();
  }
  admin({required email, required name,required role,required id}) {
    _adminRepository.admin(email, name,role,id);
  }
}