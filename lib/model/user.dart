class User {
  final int userId;
  final String firstName;
  final String lastName;
  final String email;
  final String role;
  final int validity;
  final String token;
  final String facebook;
  final String twitter;
  final String linkedin;
  final String biography;
  final String image;

  User(
    this.userId,
    this.firstName,
    this.lastName,
    this.email,
    this.role,
    this.validity,
    this.token,
    this.facebook,
    this.twitter,
    this.linkedin,
    this.biography,
    this.image,
  );

  User.fromJson(Map<String, dynamic> json)
      : userId = json["user_id"],
        firstName = json["first_name"],
        lastName = json["last_name"],
        email = json["email"],
        role = json["role"],
        validity = json["validity"],
        token = json["token"],
        facebook = json["facebook"],
        twitter = json["twitter"],
        linkedin = json["linkedin"],
        biography = json["biography"],
        image = json["image"];
}
