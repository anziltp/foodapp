import 'package:flutter/cupertino.dart';

class ItemModel {
  String ItemName;
  String ItemImage;
  String ItemDescription;
  double ItemPrice;
  String ItemId;
  String categoryId;
  List Fav;

  ItemModel({required this.ItemName,required this.ItemDescription,required this.ItemImage,required this.ItemPrice,required this.ItemId,required this.Fav,required this.categoryId});

  Map<String,dynamic> toMap() {
    return {
      "ItemName": this.ItemName,
      "ItemImage": this.ItemImage,
      "ItemDescription": this.ItemDescription,
      "ItemPrice": this.ItemPrice,
      "ItemId":this.ItemId,
      "categoryId":this.categoryId,
      "Fav":this.Fav
    };
  }
    factory ItemModel.fromMap(Map<String,dynamic>map){
    return ItemModel(
      ItemName: map["ItemName"]??"",
      ItemDescription: map["ItemDescription"]??"",
      ItemImage: map["ItemImage"]??"",
      ItemPrice: map["ItemPrice"]??"",
      ItemId: map["ItemId"]??"",
        Fav: map["Fav"]??"",
      categoryId: map["categoryId"]??""
    );
    }

    ItemModel copyWith({
      String? ItemName,
      String? ItemImage,
      String? ItemDescription,
      double? ItemPrice,
      String? ItemId,
      List? Fav,
      String?categoryId
    })
    {
    return ItemModel(
        ItemName: ItemName??this.ItemName,
        ItemDescription: ItemDescription??this.ItemDescription,
        ItemImage: ItemImage??this.ItemImage,
        ItemPrice: ItemPrice??this.ItemPrice,
        ItemId: ItemId??this.ItemId,
      categoryId: categoryId??this.categoryId,
      Fav: Fav??this.Fav
    );

    }

}