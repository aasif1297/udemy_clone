class CategoriesResponse {
  final String id;
  final String code;
  final String name;
  final String parent;
  final String slug;
  final String dateAdded;
  final String lastModified;
  final String fontAwesomeClass;
  final String thumbnail;
  final int numberOfCourses;
  final String error;

  CategoriesResponse(
      this.id,
      this.code,
      this.name,
      this.parent,
      this.slug,
      this.dateAdded,
      this.lastModified,
      this.fontAwesomeClass,
      this.thumbnail,
      this.numberOfCourses,
      this.error);

  CategoriesResponse.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        code = json['code'],
        name = json['name'],
        parent = json['parent'],
        slug = json['slug'],
        dateAdded = json['date_added'],
        lastModified = json['last_modified'],
        fontAwesomeClass = json['font_awesome_class'],
        thumbnail = json['thumbnail'],
        numberOfCourses = json['number_of_courses'],
        error = "";

  CategoriesResponse.withError(String errorValue)
      : id = "",
        code = "",
        name = "",
        parent = "",
        slug = "",
        dateAdded = "",
        lastModified = "",
        fontAwesomeClass = "",
        thumbnail = "",
        numberOfCourses = 0,
        error = errorValue;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['parent'] = this.parent;
    data['slug'] = this.slug;
    data['date_added'] = this.dateAdded;
    data['last_modified'] = this.lastModified;
    data['font_awesome_class'] = this.fontAwesomeClass;
    data['thumbnail'] = this.thumbnail;
    data['number_of_courses'] = this.numberOfCourses;
    return data;
  }
}
