import 'package:flutter/material.dart';
import 'package:thecatapi_flutter/common/resource.dart';
import 'package:thecatapi_flutter/domain/entities/cat.dart';
import 'package:thecatapi_flutter/domain/usecases/get_cats_usecase.dart';

class CatListViewModel extends ChangeNotifier {
  final GetCatsImageUseCase getCatsUseCase = GetCatsImageUseCase();

  List<Cat> _cats = [];
  List<Cat> get cats => _cats;
  bool isLoading = false;
  String? errorMessage = "";

  // pagination state
  int page = 0;
  int limit = 20;
  bool canLoadMorePages = true;

  CatListViewModel() {
    loadCats();
  }

  Future<void> loadCats() async {
    if (!canLoadMorePages || isLoading) return;
    isLoading = true;
    errorMessage = null;
    notifyListeners();
    getCatsUseCase.execute(page, limit).listen((resource) {
      // Handle different resource states
      switch (resource.state) {
        case ResourceState.loading:
          // isLoading = true;
          break;
        case ResourceState.success:
          _cats = cats + (resource.data ?? []);
          isLoading = false;
          if (resource.data!.length < limit) {
            canLoadMorePages = false;
            break;
          }
          page += 1;
          break;
        case ResourceState.error:
          errorMessage = resource.message;
          isLoading = false;
          break;
      }
      // Notify listeners to rebuild the UI
      notifyListeners();
    });
  }
}
