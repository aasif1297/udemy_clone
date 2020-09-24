class RegisterResponse {
  final String data;
  final String message;
  final bool success;
  final String error;

  RegisterResponse({this.data, this.message, this.success, this.error});

  RegisterResponse.fromJson(Map<String, dynamic> json)
      : data = json['data'],
        message = json['message'],
        success = json['success'],
        error = "";

  RegisterResponse.withError(String errorValue)
      : data = "",
        message = "",
        success = null,
        error = errorValue;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['message'] = this.message;
    data['success'] = this.success;
    return data;
  }
}
