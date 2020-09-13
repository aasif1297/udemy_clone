import 'package:rxdart/rxdart.dart';
import 'package:udemy_clone/model/my_courses_response.dart';
import 'package:udemy_clone/repository/repository.dart';

class MyCoursesBloc {
  MainRepository _mainRepository = MainRepository();
  BehaviorSubject<List<MyCoursesResponse>> _subject =
      BehaviorSubject<List<MyCoursesResponse>>();

  getMyCourses(String token) async {
    List<MyCoursesResponse> response =
        await _mainRepository.getMyCourses(token);
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<List<MyCoursesResponse>> get subject => _subject;
}

var myCoursesBloc = MyCoursesBloc();
