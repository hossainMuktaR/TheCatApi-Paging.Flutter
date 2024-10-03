import 'package:thecatapi_flutter/domain/entities/cat.dart';

abstract class CatApiService {
  Future<List<Cat>> getCats(int page, int limit);
}