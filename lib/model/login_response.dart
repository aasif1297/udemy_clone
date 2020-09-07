class LoginResponse {
  String userId;
  String firstName;
  String lastName;
  String email;
  String role;
  int validity;
  String token;
  String error;

  LoginResponse(
      {this.userId,
      this.firstName,
      this.lastName,
      this.email,
      this.role,
      this.validity,
      this.token,
      this.error});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    role = json['role'];
    validity = json['validity'];
    token = json['token'];
    error = "";
  }

  LoginResponse.withError(String errorValue)
      : userId = "",
        firstName = "",
        lastName = "",
        email = "",
        role = "",
        validity = 0,
        token = "",
        error = errorValue;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['role'] = this.role;
    data['validity'] = this.validity;
    data['token'] = this.token;
    data['error'] = this.error;
    return data;
  }
}
