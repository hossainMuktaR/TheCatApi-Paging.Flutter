import 'package:thecatapi_flutter/domain/entities/cat.dart';

abstract class CatRepository {
  Future<List<Cat>> getCats(int page, int limit);
}
