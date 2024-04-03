import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/feature/adding_products/repository/items_repository.dart';
import 'package:foodapp/models/items_model.dart';


final itemsControllerprovider=Provider((ref) => ItemsController(itemsRepository: ref.watch(itemsRepositoryProvider)));

// final streamItemsProvider=StreamProvider((ref) => ref.watch(itemsRepositoryProvider).streamItems());

class ItemsController{
  final ItemsRepository _itemsRepository;

  ItemsController({required ItemsRepository itemsRepository}):_itemsRepository=itemsRepository;

  addingItems({ required String categoryId, required ItemModel itemAdding}){
  _itemsRepository.addItem(categoryId:categoryId ,itemmodel:itemAdding );
  }

}