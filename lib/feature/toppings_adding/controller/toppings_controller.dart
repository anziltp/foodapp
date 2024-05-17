import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/feature/toppings_adding/repository/toppings_repository.dart';
import 'package:foodapp/models/toppings_model.dart';

final toppingsControllerprovider=StateNotifierProvider((ref) => ToppingsController(toppingsRepository: ref.watch(toppingsRepositoryProvider)));
final toppingsStream=StreamProvider.autoDispose.family((ref, String categoryId) => ref.watch(toppingsControllerprovider.notifier).userDetails(categoryId: categoryId));

final toppingsAdding=Provider.autoDispose.family((ref,ToppingsModel toppingsModel) => ref.watch(toppingsControllerprovider.notifier).addingToppings( toppingsModel: toppingsModel));


class ToppingsController extends StateNotifier {
  final ToppingsRepository _toppingsRepository;

  ToppingsController({required ToppingsRepository toppingsRepository})
      :_toppingsRepository=toppingsRepository,
        super(null);

  Stream<List<ToppingsModel>> userDetails({required String categoryId}) {
    return _toppingsRepository.toppingsData(categoryId);
  }
  addingToppings({ required ToppingsModel toppingsModel}){
    _toppingsRepository.addToppings(categoryId:toppingsModel.categoryId ,toppingsModel:toppingsModel );
  }



  deleteToppings({required String categoryid,required String id}){
    print("this is category iddddddddddddddddddd");
    print("this is category iddddddddddddddddddd $categoryid");
    print("this is category seccccccond $id");
    print(id);
    _toppingsRepository.deleteToppings( categoryid:categoryid, id: id);
  }
}