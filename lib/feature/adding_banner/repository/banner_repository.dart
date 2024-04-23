
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/models/banner_model.dart';

import '../../../core/Provider/provider.dart';

final bannerRepositoryProvider=Provider((ref) => BannerRepository(firestore: ref.watch(firestoreprovider)));
class BannerRepository{
  final FirebaseFirestore _firestore;
  BannerRepository({required FirebaseFirestore firestore }):_firestore=firestore;
  CollectionReference get _banner=>_firestore.collection("Banner");

  streamingData(){
    return _banner.snapshots().map((event) => event.docs.map((e) => BannerModel.fromMap(e.data() as Map<String,dynamic>)).toList());
  }
  banner(image,id){
    BannerModel bannerModel=BannerModel( image: image, id: id);
    _banner.add(bannerModel.toMap()).then((value){
      value.update(bannerModel.copyWith(id: value.id).toMap());
    });
}
  deleteBanner(String id){
    _banner.doc(id).delete();
  }
}