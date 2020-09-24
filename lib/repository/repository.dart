import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:udemy_clone/model/categories_response.dart';
import 'package:udemy_clone/model/course_detail_response.dart';
import 'package:udemy_clone/model/courses_response.dart';
import 'package:udemy_clone/model/login_response.dart';
import 'package:udemy_clone/model/my_courses_response.dart';
import 'package:udemy_clone/model/save_course_response.dart';
import 'package:udemy_clone/model/sections.dart';
import 'package:udemy_clone/model/update_user_detail_repsponse.dart';
import 'package:udemy_clone/model/user_detail.dart';

import '../model/courses_response.dart';

class MainRepository {
  static String mainUrl = "https://demo.academy-lms.com/default/index.php/api";
  // static String mainUrl = "http://doshopping.pk/academy/api";
  final Dio _dio = Dio();
  var categories_url = '$mainUrl/categories';
  var login_url = '$mainUrl/login';
  var category_wise_course_url = '$mainUrl/category_wise_course';
  var top_courses_url = "$mainUrl/top_courses";
  var courses_by_search_url = "$mainUrl/courses_by_search_string";
  var course_details_by_id = "$mainUrl/course_details_by_id";
  var course_purchase_url =
      "https://www.demo.academy-lms.com/default/index.php/home/course_purchase/";
  var my_courses_url = "$mainUrl/my_courses";
  var fav_courses_url = "$mainUrl/my_wishlist";
  var user_details_url = "$mainUrl/userdata";
  var update_user_details_url = "$mainUrl/update_userdata";
  var sections_url = "$mainUrl/sections";
  var save_course_progress_url = "$mainUrl/save_course_progress";

  //https://demo.academy-lms.com/default/index.php/api/sections?

  Future<SaveCourseProgressResponse> saveCourseProgress(
      String token, String lessonId, String progress) async {
    var params = {
      'auth_token': token,
      'lesson_id': lessonId,
      'progress': progress
    };
    try {
      Response response =
          await _dio.get(save_course_progress_url, queryParameters: params);
      return SaveCourseProgressResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      return SaveCourseProgressResponse.withError("$error");
    }
  }

  Future<List<Sections>> getAllSections(String token, String courseID) async {
    var params = {'auth_token': token, 'course_id': courseID};
    try {
      Response<String> response =
          await _dio.get(sections_url, queryParameters: params);
      List responseJson = json.decode(response.data);
      return responseJson.map((e) => Sections.fromJson(e)).toList();
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<UpdateUserDetailsResponse> updateUserDetails(
      String token, UserDetails userDetails) async {
    var params = {
      'auth_token': token,
      'first_name': userDetails.firstName,
      'last_name': userDetails.lastName,
      'email': userDetails.email,
      'biography': userDetails.biography,
      'twitter_link': userDetails.twitter,
      'facebook_link': userDetails.twitter,
      'linkedin_link': userDetails.linkedin
    };
    try {
      _dio.options.headers = {
        "content-type": 'application/x-www-form-urlencoded'
      };
      Response response =
          await _dio.post(update_user_details_url, data: params);
      return UpdateUserDetailsResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return UpdateUserDetailsResponse.withError("$error");
    }
  }

  Future<UserDetails> getUserDetails(String token) async {
    var params = {"auth_token": token};

    try {
      Response response =
          await _dio.get(user_details_url, queryParameters: params);
      return UserDetails.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<List<CoursesResponse>> getFavCourses(String token) async {
    var params = {"auth_token": token};

    try {
      Response<String> response =
          await _dio.get(fav_courses_url, queryParameters: params);
      List responseJson = json.decode(response.data);
      return responseJson.map((e) => CoursesResponse.fromJson(e)).toList();
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<List<MyCoursesResponse>> getMyCourses(String token) async {
    var params = {"auth_token": token};
    try {
      Response<String> response =
          await _dio.get(my_courses_url, queryParameters: params);
      List responseJson = json.decode(response.data);
      return responseJson.map((e) => MyCoursesResponse.fromJson(e)).toList();
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<List<CourseDetailResponse>> getCourseDetailsById(
      String id, String token) async {
    var params = {"auth_token": token, "course_id": id};
    try {
      Response<String> response =
          await _dio.get(course_details_by_id, queryParameters: params);
      List responseJson = json.decode(response.data);
      return responseJson.map((e) => CourseDetailResponse.fromJson(e)).toList();
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<List<CoursesResponse>> getAllCourses() async {
    try {
      Response<String> response = await _dio.get(courses_by_search_url);
      List responseJson = json.decode(response.data);
      return responseJson.map((e) => CoursesResponse.fromJson(e)).toList();
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<LoginResponse> login(String email, String password) async {
    var params = {'email': email, 'password': password};
    try {
      Response response = await _dio.get(login_url, queryParameters: params);
      return LoginResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      LoginResponse.withError("$error");
    }
  }

  Future<List<CategoriesResponse>> getCategories() async {
    try {
      Response<String> response = await _dio.get(categories_url);
      List responseJson = json.decode(response.data);
      return responseJson.map((e) => CategoriesResponse.fromJson(e)).toList();
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<List<CoursesResponse>> getCoursesById(String id) async {
    var params = {'category_id': id};

    try {
      Response<String> response =
          await _dio.get(category_wise_course_url, queryParameters: params);
      List responseJson = json.decode(response.data);
      return responseJson.map((e) => CoursesResponse.fromJson(e)).toList();
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<List<CoursesResponse>> getAllTopCourses() async {
    try {
      Response<String> response = await _dio.get(top_courses_url);
      List responseJson = json.decode(response.data);
      return responseJson.map((e) => CoursesResponse.fromJson(e)).toList();
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }
}
