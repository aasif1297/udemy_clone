import 'package:rxdart/rxdart.dart';
import 'package:udemy_clone/model/categories_response.dart';
import 'package:udemy_clone/repository/repository.dart';

class CategoriesBloc {
  MainRepository _mainRepository = MainRepository();
  BehaviorSubject<List<CategoriesResponse>> _subject =
      BehaviorSubject<List<CategoriesResponse>>();

  getCategories() async {
    List<CategoriesResponse> response = await _mainRepository.getCategories();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<List<CategoriesResponse>> get subject => _subject;
}

var categoriesBloc = CategoriesBloc();
