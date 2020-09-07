import 'package:dio/dio.dart';

class MovieRepository {
  final String apiKey = "1acad6e7ed26674ee808facebb36cd00";
  static String mainUrl = "https://demo.academy-lms.com/default/index.php/api/";

  final Dio _dio = Dio();
  var getPopularUrl = '$mainUrl/movie/top_rated';

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
