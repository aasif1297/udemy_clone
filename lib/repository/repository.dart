import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:udemy_clone/model/categories_response.dart';
import 'package:udemy_clone/model/courses_response.dart';
import 'package:udemy_clone/model/login_response.dart';

import '../model/courses_response.dart';

class MainRepository {
  static String mainUrl = "https://demo.academy-lms.com/default/index.php/api";

  final Dio _dio = Dio();
  var categories_url = '$mainUrl/categories';
  var login_url = '$mainUrl/login';
  var category_wise_course_url = '$mainUrl/category_wise_course';
  var top_courses_url = "$mainUrl/top_courses";
  var courses_by_search_url = "$mainUrl/courses_by_search_string";

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
      // Response response = await _dio.get(categoriesURL);
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

  // Future<MovieResponse> getMovies() async {
  //   var params = {'api_key': apiKey, 'language': 'en-US', 'page': 1};

  //   try {
  //     Response response = await _dio.get(getMoviesUrl, queryParameters: params);
  //     return MovieResponse.fromJson(response.data);
  //   } catch (error, stacktrace) {
  //     print("Exception occured: $error stackTrace: $stacktrace");
  //     return MovieResponse.withError("$error");
  //   }
  // }

  // Future<MovieResponse> getPlayingMovies() async {
  //   var params = {"api_key": apiKey, "language": "en-US", "page": 1};

  //   try {
  //     Response response =
  //         await _dio.get(getPlayingUrl, queryParameters: params);
  //     return MovieResponse.fromJson(response.data);
  //   } catch (error, stacktrace) {
  //     print("Exception occured: $error stackTrace: $stacktrace");
  //     return MovieResponse.withError("$error");
  //   }
  // }

  // Future<PersonResponse> getPersons() async {
  //   var params = {'api_key': apiKey};

  //   try {
  //     Response response =
  //         await _dio.get(getPersonsUrl, queryParameters: params);
  //     return PersonResponse.fromJson(response.data);
  //   } catch (error, stacktrace) {
  //     print("Exception occured: $error stackTrace: $stacktrace");
  //     return PersonResponse.withError("$error");
  //   }
  // }

  // Future<GenreResponse> getGenre() async {
  //   var params = {'api_key': apiKey, 'language': 'en-US'};

  //   try {
  //     Response response = await _dio.get(getGenresUrl, queryParameters: params);
  //     return GenreResponse.fromJson(response.data);
  //   } catch (error, stacktrace) {
  //     print("Exception occured: $error stackTrace: $stacktrace");
  //     return GenreResponse.withError("$error");
  //   }
  // }

  // Future<MovieResponse> getMovieByGenre(int id) async {
  //   var params = {
  //     'api_key': apiKey,
  //     'language': 'en-US',
  //     'page': 1,
  //     'with_genres': id
  //   };

  //   try {
  //     Response response = await _dio.get(getMoviesUrl, queryParameters: params);
  //     return MovieResponse.fromJson(response.data);
  //   } catch (error, stacktrace) {
  //     print("Exception occured: $error stackTrace: $stacktrace");
  //     return MovieResponse.withError("$error");
  //   }
  // }

  // Future<MovieDetailResponse> getMovieDetail(int id) async {
  //   var params = {"api_key": apiKey, "language": "en-US"};
  //   try {
  //     Response response =
  //         await _dio.get(movieUrl + "/$id", queryParameters: params);
  //     return MovieDetailResponse.fromJson(response.data);
  //   } catch (error, stacktrace) {
  //     print("Exception occured: $error stackTrace: $stacktrace");
  //     return MovieDetailResponse.withError("$error");
  //   }
  // }

  // Future<CastResponse> getCast(int id) async {
  //   var params = {"api_key": apiKey, "language": "en-US"};
  //   try {
  //     Response response = await _dio.get(movieUrl + "/$id" + "/credits",
  //         queryParameters: params);
  //     return CastResponse.fromJson(response.data);
  //   } catch (error, stacktrace) {
  //     print("Exception occured: $error stackTrace: $stacktrace");
  //     return CastResponse.withError("$error");
  //   }
  // }

  // Future<MovieResponse> getSimilarMovies(int id) async {
  //   var params = {
  //     'api_key': apiKey,
  //     'language': 'en-US',
  //   };

  //   try {
  //     Response response =
  //         await _dio.get("$movieUrl/$id/similar", queryParameters: params);
  //     return MovieResponse.fromJson(response.data);
  //   } catch (error, stacktrace) {
  //     print("Exception occured: $error stackTrace: $stacktrace");
  //     return MovieResponse.withError("$error");
  //   }
  // }

  // Future<VideoResponse> getVideos(int id) async {
  //   var params = {
  //     'api_key': apiKey,
  //     'language': 'en-US',
  //   };

  //   try {
  //     Response response =
  //         await _dio.get("$movieUrl/$id/videos", queryParameters: params);
  //     return VideoResponse.fromJson(response.data);
  //   } catch (error, stacktrace) {
  //     print("Exception occured: $error stackTrace: $stacktrace");
  //     return VideoResponse.withError("$error");
  //   }
  // }

}
