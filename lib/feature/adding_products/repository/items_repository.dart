import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/core/Provider/provider.dart';
import 'package:foodapp/models/items_model.dart';

final itemsRepositoryProvider=Provider((ref) => ItemsRepository(firestore: ref.watch(firestoreprovider)));

class ItemsRepository{
  final FirebaseFirestore _firestore;

  ItemsRepository({required FirebaseFirestore firestore}):_firestore=firestore;

  CollectionReference get _items=>_firestore.collection("Categories");
  ///streaming
  Stream<List<ItemModel>>itemData(categoryId){
   var data= _items.doc(categoryId).collection("Subitems").snapshots().map((event) => event.docs.map((e) => ItemModel.fromMap(e.data())).toList());
    return data;
  }
  ///delete
  deleteSubItems({required String categoryid,required String ItemId}){

    _items.doc(categoryid).collection("Subitems").doc(ItemId).delete();
  }
  ///adding
  addItem({required String categoryId,required ItemModel itemmodel }){
    _items.doc(categoryId).collection("Subitems").add(itemmodel.toMap()).then((value) {
      value.update(itemmodel.copyWith(ItemId: value.id).toMap());
    });
  }
  updateItemsData(ItemModel itemModel){
    print("hgjfgkghlkh");
    print(itemModel.ItemPrice);
    print(itemModel.ItemPrice.runtimeType);
    _items.doc(itemModel.categoryId).collection("Subitems").doc(itemModel.ItemId).update(itemModel.toMap());
  }
}