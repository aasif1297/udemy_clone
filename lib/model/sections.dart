import 'package:udemy_clone/model/lessons.dart';

class Sections {
  String id;
  String title;
  String courseId;
  String order;
  List<Lessons> lessons;
  String totalDuration;
  int lessonCounterStarts;
  int lessonCounterEnds;
  int completedLessonNumber;
  bool userValidity;

  Sections(
      {this.id,
      this.title,
      this.courseId,
      this.order,
      this.lessons,
      this.totalDuration,
      this.lessonCounterStarts,
      this.lessonCounterEnds,
      this.completedLessonNumber,
      this.userValidity});

  Sections.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    courseId = json['course_id'];
    order = json['order'];
    if (json['lessons'] != null) {
      lessons = new List<Lessons>();
      json['lessons'].forEach((v) {
        lessons.add(new Lessons.fromJson(v));
      });
    }
    totalDuration = json['total_duration'];
    lessonCounterStarts = json['lesson_counter_starts'];
    lessonCounterEnds = json['lesson_counter_ends'];
    completedLessonNumber = json['completed_lesson_number'];
    userValidity = json['user_validity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['course_id'] = this.courseId;
    data['order'] = this.order;
    if (this.lessons != null) {
      data['lessons'] = this.lessons.map((v) => v.toJson()).toList();
    }
    data['total_duration'] = this.totalDuration;
    data['lesson_counter_starts'] = this.lessonCounterStarts;
    data['lesson_counter_ends'] = this.lessonCounterEnds;
    data['completed_lesson_number'] = this.completedLessonNumber;
    data['user_validity'] = this.userValidity;
    return data;
  }
}
