import 'package:rxdart/rxdart.dart';
import 'package:udemy_clone/model/courses_response.dart';
import 'package:udemy_clone/repository/repository.dart';

class CoursesBloc {
  MainRepository _mainRepository = MainRepository();
  BehaviorSubject<List<CoursesResponse>> _subject =
      BehaviorSubject<List<CoursesResponse>>();

  BehaviorSubject<List<CoursesResponse>> _subjectById =
      BehaviorSubject<List<CoursesResponse>>();

  getCoursesById(String id) async {
    List<CoursesResponse> response = await _mainRepository.getCoursesById(id);
    _subjectById.sink.add(response);
  }

  getAllCourses() async {
    List<CoursesResponse> response = await _mainRepository.getAllCourses();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
    _subjectById.close();
  }

  BehaviorSubject<List<CoursesResponse>> get subject => _subject;
  BehaviorSubject<List<CoursesResponse>> get subjectById => _subjectById;
}

var coursesBloc = CoursesBloc();
