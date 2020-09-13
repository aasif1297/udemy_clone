import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:udemy_clone/model/course_detail_response.dart';
import 'package:udemy_clone/repository/repository.dart';

class CourseDetailByIdBloc {
  MainRepository _mainRepository = MainRepository();
  BehaviorSubject<List<CourseDetailResponse>> _subject =
      BehaviorSubject<List<CourseDetailResponse>>();

  getCourseDetalById(String id, String token) async {
    List<CourseDetailResponse> response =
        await _mainRepository.getCourseDetailsById(id, token);
    _subject.sink.add(response);
  }

  void dainStream() {
    _subject.value = null;
  }

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<List<CourseDetailResponse>> get subject => _subject;
}

var courseDetailByIdBloc = CourseDetailByIdBloc();
