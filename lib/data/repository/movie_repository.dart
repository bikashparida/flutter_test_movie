import 'dart:convert';
import 'dart:developer';
import 'package:flutter_test_movie/data/model/movie_model.dart';
import 'package:http/http.dart' as http;

class APICall {
  static Future<List<MovieModel>?> getData() async {
    try {
      var url = Uri.parse('https://api.tvmaze.com/search/shows?q=all');
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        var movieData = jsonDecode(response.body);
        return List<MovieModel>.from(
            movieData.map((e) => MovieModel.fromJson(e)));
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<List<MovieModel>?> getSearchData(String movieName) async {
    try {
      var url = Uri.parse('https://api.tvmaze.com/search/shows?q=$movieName');
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        var searchMovieData = jsonDecode(response.body);
        return List<MovieModel>.from(
            searchMovieData.map((e) => MovieModel.fromJson(e)));
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
