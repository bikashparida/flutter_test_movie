import 'package:flutter/material.dart';
import 'package:flutter_test_movie/data/model/movie_model.dart';
import 'package:flutter_test_movie/data/repository/movie_repository.dart';

class MovieProvider extends ChangeNotifier {
  bool isLoading = true;
  List<MovieModel>? movieData = [];
  List<MovieModel>? searchMoviedata = [];

  Future<void> getMovieData() async {
    movieData = await APICall.getData();
    isLoading = false;
    notifyListeners();
  }

  Future<void> getSearchMovieData(String value) async {
    searchMoviedata = await APICall.getSearchData(value);
    isLoading = false;
    notifyListeners();
  }
}
