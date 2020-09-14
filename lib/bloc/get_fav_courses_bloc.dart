import 'package:rxdart/rxdart.dart';
import 'package:udemy_clone/model/courses_response.dart';
import 'package:udemy_clone/repository/repository.dart';

class FavCoursesBloc {
  MainRepository _mainRepository = MainRepository();
  BehaviorSubject<List<CoursesResponse>> _subject =
      BehaviorSubject<List<CoursesResponse>>();

  getFavCourses(String token) async {
    List<CoursesResponse> response = await _mainRepository.getFavCourses(token);
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<List<CoursesResponse>> get subject => _subject;
}

var favCoursesBloc = FavCoursesBloc();
