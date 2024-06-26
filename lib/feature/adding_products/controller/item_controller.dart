import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/feature/adding_products/repository/items_repository.dart';
import 'package:foodapp/models/items_model.dart';


final itemsControllerprovider=StateNotifierProvider((ref) => ItemsController(itemsRepository: ref.watch(itemsRepositoryProvider)));
final itemStream=StreamProvider.autoDispose.family((ref, String categoryId) => ref.watch(itemsControllerprovider.notifier).userDetails(categoryId: categoryId));
final itemAdding=Provider.autoDispose.family((ref,ItemModel itemModel) => ref.watch(itemsControllerprovider.notifier).addingItems(itemModel: itemModel));

// final streamItemsProvider=StreamProvider((ref) => ref.watch(itemsRepositoryProvider).streamItems());

class ItemsController extends StateNotifier{
  final ItemsRepository _itemsRepository;

  ItemsController( {required ItemsRepository itemsRepository}):_itemsRepository=itemsRepository,super(null);
  ///streaming
  Stream<List<ItemModel>> userDetails({required String categoryId}){
    return _itemsRepository.itemData(categoryId);
  }
  ///delete
  deleteSubItems({required String categoryid,required String ItemId}){
    _itemsRepository.deleteSubItems( categoryid:categoryid, ItemId: ItemId);
  }
  ///adding
  addingItems({ required ItemModel itemModel}){
      _itemsRepository.addItem(categoryId:itemModel.categoryId ,itemmodel:itemModel );
  }
  itemsUpdate(ItemModel itemModel){
    _itemsRepository.updateItemsData(itemModel);
  }


}