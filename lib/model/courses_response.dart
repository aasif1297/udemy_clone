class CoursesResponse {
  String id;
  String title;
  String shortDescription;
  String description;
  List<String> outcomes;
  String language;
  String categoryId;
  String subCategoryId;
  String section;
  List<String> requirements;
  String price;
  String discountFlag;
  String discountedPrice;
  String level;
  String userId;
  String thumbnail;
  String videoUrl;
  String dateAdded;
  String lastModified;
  String visibility;
  String isTopCourse;
  String isAdmin;
  String status;
  String courseOverviewProvider;
  String metaKeywords;
  String metaDescription;
  String isFreeCourse;
  int rating;
  int numberOfRatings;
  String instructorName;
  int totalEnrollment;
  String shareableLink;
  String error;

  CoursesResponse(
      {this.id,
      this.title,
      this.shortDescription,
      this.description,
      this.outcomes,
      this.language,
      this.categoryId,
      this.subCategoryId,
      this.section,
      this.requirements,
      this.price,
      this.discountFlag,
      this.discountedPrice,
      this.level,
      this.userId,
      this.thumbnail,
      this.videoUrl,
      this.dateAdded,
      this.lastModified,
      this.visibility,
      this.isTopCourse,
      this.isAdmin,
      this.status,
      this.courseOverviewProvider,
      this.metaKeywords,
      this.metaDescription,
      this.isFreeCourse,
      this.rating,
      this.numberOfRatings,
      this.instructorName,
      this.totalEnrollment,
      this.shareableLink,
      this.error});

  CoursesResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    shortDescription = json['short_description'];
    description = json['description'];
    // outcomes = json['outcomes'].cast<String>();
    language = json['language'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    section = json['section'];
    // requirements = json['requirements'].cast<String>();
    price = json['price'];
    discountFlag = json['discount_flag'];
    discountedPrice = json['discounted_price'];
    level = json['level'];
    userId = json['user_id'];
    thumbnail = json['thumbnail'];
    videoUrl = json['video_url'];
    dateAdded = json['date_added'];
    lastModified = json['last_modified'];
    visibility = json['visibility'];
    isTopCourse = json['is_top_course'];
    isAdmin = json['is_admin'];
    status = json['status'];
    courseOverviewProvider = json['course_overview_provider'];
    metaKeywords = json['meta_keywords'];
    metaDescription = json['meta_description'];
    isFreeCourse = json['is_free_course'];
    rating = json['rating'];
    numberOfRatings = json['number_of_ratings'];
    instructorName = json['instructor_name'];
    totalEnrollment = json['total_enrollment'];
    shareableLink = json['shareable_link'];
    error = "";
  }

  CoursesResponse.withError(String error) {
    id = "";
    title = "";
    shortDescription = "";
    description = "";
    outcomes = null;
    language = "";
    categoryId = "";
    subCategoryId = "";
    section = "";
    requirements = null;
    price = "";
    discountFlag = "";
    discountedPrice = "";
    level = "";
    userId = "";
    thumbnail = "";
    videoUrl = "";
    dateAdded = "";
    lastModified = "";
    visibility = "";
    isTopCourse = "";
    isAdmin = "";
    status = "";
    courseOverviewProvider = "";
    metaKeywords = "";
    metaDescription = "";
    isFreeCourse = "";
    rating = 0;
    numberOfRatings = 0;
    instructorName = "";
    totalEnrollment = 0;
    shareableLink = "";
    error = "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['short_description'] = this.shortDescription;
    data['description'] = this.description;
    data['outcomes'] = this.outcomes;
    data['language'] = this.language;
    data['category_id'] = this.categoryId;
    data['sub_category_id'] = this.subCategoryId;
    data['section'] = this.section;
    data['requirements'] = this.requirements;
    data['price'] = this.price;
    data['discount_flag'] = this.discountFlag;
    data['discounted_price'] = this.discountedPrice;
    data['level'] = this.level;
    data['user_id'] = this.userId;
    data['thumbnail'] = this.thumbnail;
    data['video_url'] = this.videoUrl;
    data['date_added'] = this.dateAdded;
    data['last_modified'] = this.lastModified;
    data['visibility'] = this.visibility;
    data['is_top_course'] = this.isTopCourse;
    data['is_admin'] = this.isAdmin;
    data['status'] = this.status;
    data['course_overview_provider'] = this.courseOverviewProvider;
    data['meta_keywords'] = this.metaKeywords;
    data['meta_description'] = this.metaDescription;
    data['is_free_course'] = this.isFreeCourse;
    data['rating'] = this.rating;
    data['number_of_ratings'] = this.numberOfRatings;
    data['instructor_name'] = this.instructorName;
    data['total_enrollment'] = this.totalEnrollment;
    data['shareable_link'] = this.shareableLink;
    return data;
  }
}
