import 'package:rxdart/rxdart.dart';
import '../model/courses_response.dart';
import '../repository/repository.dart';

class AllCoursesBloc {
  MainRepository _mainRepository = MainRepository();
  BehaviorSubject<List<CoursesResponse>> _subject =
      BehaviorSubject<List<CoursesResponse>>();

  getAllCourses() async {
    List<CoursesResponse> response = await _mainRepository.getAllCourses();
    _subject.sink.add(response);
  }

  BehaviorSubject<List<CoursesResponse>> get subject => _subject;
}

var allCoursesBloc = AllCoursesBloc();
