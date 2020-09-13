import 'package:rxdart/rxdart.dart';
import 'package:udemy_clone/model/course_detail_response.dart';
import 'package:udemy_clone/repository/repository.dart';

class CourseDetailByIdBloc {
  MainRepository _mainRepository = MainRepository();
  BehaviorSubject<List<CourseDetailResponse>> _subject =
      BehaviorSubject<List<CourseDetailResponse>>();

  getCourseDetalById(String id) async {
    List<CourseDetailResponse> response =
        await _mainRepository.getCourseDetailsById(id);
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<List<CourseDetailResponse>> get subject => _subject;
}

var courseDetailByIdBloc = CourseDetailByIdBloc();
