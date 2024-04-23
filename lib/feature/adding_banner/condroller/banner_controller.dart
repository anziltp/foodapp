import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/feature/adding_banner/repository/banner_repository.dart';

final bannerControllerProvider=Provider((ref) => BannerController(bannerRepository: ref.watch(bannerRepositoryProvider)));
final streambanner=StreamProvider((ref) => ref.watch(bannerControllerProvider).streamBannerData());
class BannerController {
  final BannerRepository _bannerRepository;

  BannerController({required BannerRepository bannerRepository})
      :_bannerRepository=bannerRepository;

  Stream streamBannerData() {
    return _bannerRepository.streamingData();
  }

  banner({required image, required id}) {
    _bannerRepository.banner(image, id);
  }
  deletebanner(String id){
    _bannerRepository.deleteBanner(id);
  }
}