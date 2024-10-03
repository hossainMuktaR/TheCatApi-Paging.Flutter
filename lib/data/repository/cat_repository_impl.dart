import 'package:thecatapi_flutter/data/remote/cat_api_service.dart';
import 'package:thecatapi_flutter/data/remote/cat_api_service_impl.dart';
import 'package:thecatapi_flutter/domain/entities/cat.dart';
import 'package:thecatapi_flutter/domain/repository/cat_respository.dart';

class CatRepositoryImpl implements CatRepository {
  final CatApiService apiService;
  CatRepositoryImpl({CatApiService? apiService})
      : apiService = apiService ?? CatApiServiceImpl();

  @override
  Future<List<Cat>> getCats(int page, int limit) async {
    return await apiService.getCats(page, limit);
  }
}
