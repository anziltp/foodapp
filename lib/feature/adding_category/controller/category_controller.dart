import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/feature/adding_category/repository/category_repository.dart';


final categoryControllerProvider=Provider((ref) => CategoryController(categoryRepository: ref.watch(categoryRepositoryProvider)));
final streamDataProvider=StreamProvider((ref) => ref.watch(categoryControllerProvider).streamData());

class CategoryController{
  final CategoryRepository _categoryRepository;
  CategoryController({required CategoryRepository categoryRepository}):_categoryRepository=categoryRepository;

 Stream streamData(){
    return _categoryRepository.streamData();
  }

  category({required category,required image}){
_categoryRepository.category(category, image);
  }
}