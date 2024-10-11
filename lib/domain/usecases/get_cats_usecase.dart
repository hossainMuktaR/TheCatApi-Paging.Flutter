import 'package:thecatapi_flutter/common/resource.dart';
import 'package:thecatapi_flutter/data/repository/cat_repository_impl.dart';
import 'package:thecatapi_flutter/domain/entities/cat.dart';
import 'package:thecatapi_flutter/domain/repository/cat_respository.dart';

class GetCatsImageUseCase {
  final CatRepository repository;

  GetCatsImageUseCase({CatRepository? repository}) : repository = repository ?? CatRepositoryImpl();

  Stream<Resource<List<Cat>>> execute(int page, int limit) async* {
    try {
      // Emit loading state
      yield Resource.loading();
      
      // Fetch cats from the repository
      final cats = await repository.getCats(page, limit);
      
      // Emit success state with data
      yield Resource.success(cats);
    } catch (e) {
      // Handle any other exceptions
      yield Resource.error(e.toString());
    }
  }
}