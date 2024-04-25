import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/models/toppings_model.dart';

import '../../../core/Provider/provider.dart';
import '../../admin_adding/repository/admin_repository.dart';

final ToppingsRepositoryProvider=Provider((ref) =>ToppingsRepository(firestore: ref.watch(firestoreprovider)));
class ToppingsRepository {
  final FirebaseFirestore _firestore;

  ToppingsRepository({required FirebaseFirestore firestore })
      :_firestore=firestore;
  CollectionReference get _toppings => _firestore.collection("Toppings");
  streamingData(){
    return _toppings.snapshots().map((event) => event.docs.map((e) => ToppingsModel.fromMap(e.data() as Map<String,dynamic>)).toList());
  }
  toppings(category,name,image,id){
    ToppingsModel toppingsModel= ToppingsModel( category: category, name: name,image: image, id: id);
    _toppings.add(toppingsModel.toMap()).then((value){
      value.update(toppingsModel.copyWith(id: value.id).toMap());
    });
  }}