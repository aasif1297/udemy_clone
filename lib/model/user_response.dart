import 'package:udemy_clone/model/user.dart';

class UserResponse {
  
  final User user;
  final String status;
  final String errorReason;

  UserResponse(
      this.user,
      this.status,
      this.errorReason);

  UserResponse.fromJson(Map<String, dynamic> json)
      : user = json["user"]
        status = json["status"],
        errorReason = json["error_reason"];

  UserResponse.withError(String error, this.status)
  : user = User(0,"","","","",0,"","","","","",""),
  errorReason = error;
}
