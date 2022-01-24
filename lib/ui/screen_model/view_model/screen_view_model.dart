import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_search/data/movie_api_data.dart';
import 'package:movie_search/model/movies_all_data.dart';

class ScreenViewModel with ChangeNotifier {
  List<MovieInfo> _searchMovies = [];
  List<MovieInfo> _originMovies = [];
  final MovieApi _api;
  Timer? _debounce;

  List<MovieInfo> get searchMovies => _searchMovies;

  ScreenViewModel(this._api);

  Future<void> showResult() async {
    List<MovieInfo> movies = await _api.fetchPhotos();

    _originMovies = movies;
    _searchMovies = _originMovies;
    notifyListeners();
  }

  void onQueryChanged(String query) {
    String changeQuery = query.toLowerCase();
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }

    _debounce = Timer(const Duration(milliseconds: 500), () {
      _searchMovies = _originMovies
          .where((movieInfo) =>
              movieInfo.title.toLowerCase().contains(changeQuery))
          .toList();
      notifyListeners();
    });
  }
}
