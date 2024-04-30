import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/models/toppings_model.dart';

import '../repository/toppings_repository.dart';

final toppingsControllerProvider=StateNotifierProvider((ref) => ToppingsController(ToppingsRepository: ref.watch(ToppingsRepositoryProvider), ));
final addtoppings=Provider.autoDispose.family((ref, String categoryId) => ref.watch(toppingsControllerProvider.notifier).streamToppinsData(categoryId: categoryId));

class ToppingsController  extends StateNotifier {
  final ToppingsRepository _toppingsRepository;

  ToppingsController({required
  ToppingsRepository ToppingsRepository})
      :_toppingsRepository=ToppingsRepository,super(null) ;

  Stream streamToppinsData({required String categoryId} ) {
    return _toppingsRepository.streamingData();
  }

  addingToppings({ required String toppingId,  required ToppingsModel toppingsModel}){
    _toppingsRepository.addToppings(toppingId:toppingId ,toppingsModel:toppingsModel );
  }

}