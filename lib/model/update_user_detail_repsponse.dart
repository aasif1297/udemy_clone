class UpdateUserDetailsResponse {
  String id;
  String firstName;
  String lastName;
  String email;
  String facebook;
  String twitter;
  String linkedin;
  String biography;
  String image;
  String status;
  String errorReason;
  String error;

  UpdateUserDetailsResponse(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.facebook,
      this.twitter,
      this.linkedin,
      this.biography,
      this.image,
      this.status,
      this.errorReason,
      this.error});

  UpdateUserDetailsResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    facebook = json['facebook'];
    twitter = json['twitter'];
    linkedin = json['linkedin'];
    biography = json['biography'];
    image = json['image'];
    status = json['status'];
    errorReason = json['error_reason'];
  }

  UpdateUserDetailsResponse.withError(String errorValue)
      : id = "",
        firstName = "",
        lastName = "",
        email = "",
        facebook = "",
        twitter = "",
        biography = "",
        image = "",
        status = "",
        errorReason = "",
        error = errorValue;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['facebook'] = this.facebook;
    data['twitter'] = this.twitter;
    data['linkedin'] = this.linkedin;
    data['biography'] = this.biography;
    data['image'] = this.image;
    data['status'] = this.status;
    data['error_reason'] = this.errorReason;
    return data;
  }
}
