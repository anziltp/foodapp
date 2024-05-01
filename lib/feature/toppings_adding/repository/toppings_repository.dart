import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/models/toppings_model.dart';

import '../../../core/Provider/provider.dart';

final toppingsRepositoryProvider=Provider((ref) => ToppingsRepository(firestore: ref.watch(firestoreprovider)));
class ToppingsRepository {
  final FirebaseFirestore _firestore;

  ToppingsRepository({required FirebaseFirestore firestore})
      :_firestore=firestore;

  CollectionReference get _category => _firestore.collection("Categories");

  Stream<List<ToppingsModel>> toppingsData(categoryId) {
    var data = _category.doc(categoryId)
        .collection("Toppings")
        .snapshots()
        .map((event) =>
        event.docs.map((e) => ToppingsModel.fromMap(e.data())).toList());
    return data;
  }
  addToppings({required String categoryId,required ToppingsModel toppingsModel }){
    _category.doc(categoryId).collection("Toppings").add(toppingsModel.toMap()).then((value) {
      value.update(toppingsModel.copyWith(id: value.id).toMap());
    });
}}