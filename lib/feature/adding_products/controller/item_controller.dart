import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/feature/adding_products/repository/items_repository.dart';
import 'package:foodapp/models/items_model.dart';


final itemsControllerprovider=StateNotifierProvider((ref) => ItemsControllerNotifier(itemsRepository: ref.watch(itemsRepositoryProvider)));


 // final streamItemsProvider=StreamProvider.autoDispose.family((ref,categoryId,) => ref.watch(itemsControllerprovider.notifier).addingItems(categoryId: categoryId, itemAdding: itemAdding));

class ItemsControllerNotifier extends StateNotifier{
  final ItemsRepository _itemsRepository;

  ItemsControllerNotifier({required ItemsRepository itemsRepository}):_itemsRepository=itemsRepository,super(null);

 addingItems({ required String categoryId, required ItemModel itemAdding}){
  return _itemsRepository.addItem(categoryId:categoryId ,itemmodel:itemAdding );
  }

}