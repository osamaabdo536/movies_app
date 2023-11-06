import 'dart:convert';
import 'dart:io';
import 'package:flutter_movies_app/api/api_constants.dart';
import 'package:flutter_movies_app/model/PopularResponse.dart';
import 'package:http/http.dart' as http;

class ApiManger {
  /*
  api key :  0e93998fccdc3082709a2958107274ef

  toke : eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwZTkzOTk4ZmNjZGMzMDgyNzA5YTI5NTgxMDcyNzRlZiIsInN1YiI6IjY1NDI0M
  jI0MWFjMjkyMDBhYmQ2ZjBjMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.o5z2PHekNmwwl0ZSQmqQ08qKc7D6racjRiZtfICJGH0
   */
  static Future<PopularResponse> getPopularMovies() async {
    try {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.popularApi, {
        "api_key": ApiConstants.apiKey,
      });
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return PopularResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<PopularResponse> getTopRatedMovies() async {
    try {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.topRatedApi, {
        "api_key": ApiConstants.apiKey,
      });
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return PopularResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<PopularResponse> getUpcomingMovies() async {
    try {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.upcomingApi, {
        "api_key": ApiConstants.apiKey,
      });
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return PopularResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}


