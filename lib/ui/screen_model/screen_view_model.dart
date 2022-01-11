import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_search/data/movie_api_data.dart';
import 'package:movie_search/model/movies_all_data.dart';

class ScreenViewModel with ChangeNotifier {
  List<MovieInfo> _searchMovies = [];
  List<MovieInfo> _originMovies = [];
  final MovieApi _api;
  Timer? _debounce;

  ScreenViewModel(this._api);

  Future<void> _showResult() async {
    List<MovieInfo> movies = await _api.fetchPhotos();

    _originMovies = movies;
    _searchMovies = _originMovies;
    notifyListeners();
  }

  void onQueryChanged(String query) {
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }

    _debounce = Timer(const Duration(milliseconds: 1000), () {
      _searchMovies = _originMovies
          .where((movieInfo) => movieInfo.title.contains(query))
          .toList();
      notifyListeners();
    });
  }
}
