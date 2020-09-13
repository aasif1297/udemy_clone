class Lessons {
  String id;
  String title;
  String duration;
  String courseId;
  String sectionId;
  String videoType;
  String videoUrl;
  String videoUrlWeb;
  String videoTypeWeb;
  String lessonType;
  String attachment;
  String attachmentUrl;
  String attachmentType;
  String summary;
  int isCompleted;
  bool userValidity;

  Lessons(
      {this.id,
      this.title,
      this.duration,
      this.courseId,
      this.sectionId,
      this.videoType,
      this.videoUrl,
      this.videoUrlWeb,
      this.videoTypeWeb,
      this.lessonType,
      this.attachment,
      this.attachmentUrl,
      this.attachmentType,
      this.summary,
      this.isCompleted,
      this.userValidity});

  Lessons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    duration = json['duration'];
    courseId = json['course_id'];
    sectionId = json['section_id'];
    videoType = json['video_type'];
    videoUrl = json['video_url'];
    videoUrlWeb = json['video_url_web'];
    videoTypeWeb = json['video_type_web'];
    lessonType = json['lesson_type'];
    attachment = json['attachment'];
    attachmentUrl = json['attachment_url'];
    attachmentType = json['attachment_type'];
    summary = json['summary'];
    isCompleted = json['is_completed'];
    userValidity = json['user_validity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['duration'] = this.duration;
    data['course_id'] = this.courseId;
    data['section_id'] = this.sectionId;
    data['video_type'] = this.videoType;
    data['video_url'] = this.videoUrl;
    data['video_url_web'] = this.videoUrlWeb;
    data['video_type_web'] = this.videoTypeWeb;
    data['lesson_type'] = this.lessonType;
    data['attachment'] = this.attachment;
    data['attachment_url'] = this.attachmentUrl;
    data['attachment_type'] = this.attachmentType;
    data['summary'] = this.summary;
    data['is_completed'] = this.isCompleted;
    data['user_validity'] = this.userValidity;
    return data;
  }
}
