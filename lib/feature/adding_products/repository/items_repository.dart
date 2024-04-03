import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/core/Provider/provider.dart';
import 'package:foodapp/models/items_model.dart';

final itemsRepositoryProvider=Provider((ref) => ItemsRepository(firestore: ref.watch(firestoreprovider)));

class ItemsRepository{
  final FirebaseFirestore _firestore;

  ItemsRepository({required FirebaseFirestore firestore}):_firestore=firestore;

  CollectionReference get _category=>_firestore.collection("Categories");

  addItem({required String categoryId,required ItemModel itemmodel }){
    _category.doc(categoryId).collection("Subitems").add(itemmodel.toMap()).then((value) {
      value.update(itemmodel.copyWith(ItemId: value.id).toMap());
    });
  }



}