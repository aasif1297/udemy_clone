import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:udemy_clone/model/login_response.dart';
import 'package:udemy_clone/model/register_response.dart';

class UserRepository {
  static String mainUrl = "http://doshopping.pk/academy/api";

  final Dio _dio = Dio();
  var login_url = '$mainUrl/login';
  var register_url = '$mainUrl/register';

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

  Future<RegisterResponse> register(String first_name, String last_name,
      String email, String password) async {
    var params = {
      'first_name': first_name,
      'last_name': last_name,
      'email': email,
      'password': password
    };
    try {
      _dio.options.headers = {
        "content-type": 'application/x-www-form-urlencoded'
      };

      Response response = await _dio.post(register_url, data: params);
      // Response response = await _dio.get(register_url, queryParameters: params);
      return RegisterResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      RegisterResponse.withError("$error");
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
