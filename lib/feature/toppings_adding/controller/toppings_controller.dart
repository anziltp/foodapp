import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/toppings_repository.dart';

final toppingsControllerProvider=Provider((ref) => ToppingsController(ToppingsRepository: ref.watch(ToppingsRepositoryProvider), ));
final streamtoppings=StreamProvider((ref) => ref.watch(toppingsControllerProvider).streamToppinsData());
class ToppingsController {
  final ToppingsRepository _toppingsRepository;
  ToppingsController({required
  ToppingsRepository ToppingsRepository})
      :_toppingsRepository=ToppingsRepository;
  Stream streamToppinsData() {
    return _toppingsRepository.streamingData();
  }
  toppins({required category, required name,required image,required id}) {
    _toppingsRepository.toppings(category, name,image,id);
  }
}
