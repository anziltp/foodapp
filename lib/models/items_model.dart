import 'package:flutter/cupertino.dart';

class ItemModel {
  String ItemName;
  String ItemImage;
  String CategoryName;
  String ItemDescription;
  double ItemPrice;
  String ItemId;
  String categoryId;
  List search;
  List Fav;

  ItemModel({required this.ItemName,required this.ItemDescription,required this.ItemImage,required this.ItemPrice,required this.ItemId,required this.Fav,required this.categoryId,required this.CategoryName,required this.search,});

  Map<String,dynamic> toMap() {
    return {
      "ItemName": this.ItemName,
      "ItemImage": this.ItemImage,
      "ItemDescription": this.ItemDescription,
      "ItemPrice": this.ItemPrice,
      "ItemId":this.ItemId,
      "categoryId":this.categoryId,
      "CategoryName":this.CategoryName,
      "Fav":this.Fav,
      "search":this.search
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
      categoryId: map["categoryId"]??"",
      CategoryName: map["CategoryName"]??"",
      search: map["search"]??[],

    );
    }

    ItemModel copyWith({
      String? ItemName,
      String? ItemImage,
      String? ItemDescription,
      double? ItemPrice,
      String? ItemId,
      List? Fav,
      String?categoryId,
      List?search,
      String?CategoryName,
    })
    {
    return ItemModel(
        ItemName: ItemName??this.ItemName,
        ItemDescription: ItemDescription??this.ItemDescription,
        ItemImage: ItemImage??this.ItemImage,
        ItemPrice: ItemPrice??this.ItemPrice,
        ItemId: ItemId??this.ItemId,
      categoryId: categoryId??this.categoryId,
      CategoryName: CategoryName??this.CategoryName,
      Fav: Fav??this.Fav,
    search: search??this.search
    );

    }

}