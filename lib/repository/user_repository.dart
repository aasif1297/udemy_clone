import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:udemy_clone/model/login_response.dart';

class UserRepository {
  static String mainUrl = "https://demo.academy-lms.com/default/index.php/api/";

  final Dio _dio = Dio();
  var login_url = '$mainUrl/login';

  Future<LoginResponse> login(
      {@required String email, @required String password}) async {
    var params = {'email': email, 'password': password};
    try {
      Response response = await _dio.get(login_url, queryParameters: params);
      return LoginResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      LoginResponse.withError("$error");
    }
  }

  Future<LoginResponse> authenticate({
    @required String username,
    @required String password,
  }) async {}

  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return false;
  }
}
