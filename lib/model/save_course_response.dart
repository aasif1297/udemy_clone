class SaveCourseProgressResponse {
  String courseId;
  int numberOfLessons;
  int numberOfCompletedLessons;
  int courseProgress;
  String error;

  SaveCourseProgressResponse(
      {this.courseId,
      this.numberOfLessons,
      this.numberOfCompletedLessons,
      this.courseProgress,
      this.error});

  SaveCourseProgressResponse.fromJson(Map<String, dynamic> json) {
    courseId = json['course_id'];
    numberOfLessons = json['number_of_lessons'];
    numberOfCompletedLessons = json['number_of_completed_lessons'];
    courseProgress = json['course_progress'];
    error = "";
  }

  SaveCourseProgressResponse.withError(String error)
      : courseId = "",
        numberOfLessons = 0,
        numberOfCompletedLessons = 0,
        courseProgress = 0,
        error = error;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['course_id'] = this.courseId;
    data['number_of_lessons'] = this.numberOfLessons;
    data['number_of_completed_lessons'] = this.numberOfCompletedLessons;
    data['course_progress'] = this.courseProgress;
    return data;
  }
}
