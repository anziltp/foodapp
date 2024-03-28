import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/core/Provider/provider.dart';
import 'package:foodapp/models/category_model.dart';



final categoryRepositoryProvider=Provider((ref) => CategoryRepository(firestore: ref.watch(firestoreprovider)));

class CategoryRepository{
  final FirebaseFirestore _firestore;

CategoryRepository({required FirebaseFirestore firestore }):_firestore=firestore;

CollectionReference get _Category=>_firestore.collection("Categories");

  streamData(){
    return _Category.snapshots().map((event) => event.docs.map((e) => CategoryModel.fromMap(e.data() as Map<String,dynamic>)).toList());

  }

category(category,image){
CategoryModel categoryModel=CategoryModel(category: category, image: image);
_Category.add(categoryModel.toMap());
}

}