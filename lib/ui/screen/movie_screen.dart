import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_search/components/widgets/text_info_container_widget.dart';
import 'package:movie_search/data/movie_api_data.dart';
import 'package:movie_search/model/movies_all_data.dart';
import 'package:movie_search/ui/screen/movie_detail_screen.dart';
import 'package:movie_search/ui/screen_model/screen_view_model.dart';
import 'package:provider/provider.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  final _textEditingController = TextEditingController();

  // List<MovieInfo> _searchMovies = [];
  // List<MovieInfo> _originMovies = [];
  // final _api = MovieApi();
  // Timer? _debounce;

  @override
  void initState() {
    // final viewReadModel = context.read()<ScreenViewModel>();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  // Future<void> _showResult() async {
  //   List<MovieInfo> movies = await _api.fetchPhotos();
  //   setState(() {
  //     _originMovies = movies;
  //     _searchMovies = _originMovies;
  //   });
  // }

  // void onQueryChanged(String query) {
  //   if (_debounce?.isActive ?? false) {
  //     _debounce?.cancel();
  //   }
  //
  //   _debounce = Timer(const Duration(milliseconds: 1000), () {
  //     setState(() {
  //       _searchMovies = _originMovies
  //           .where((movieInfo) => movieInfo.title.contains(query))
  //           .toList();
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ScreenViewModel>();
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text("영화 정보 검색기"),
      ),
      body: Column(
        children: [
          _buildTextField(),
          _buildMovesInfo(),
        ],
      ),
    );
  }

  Widget _buildTextField() {
    return TextFormField(
      onChanged: onQueryChanged,
      controller: _textEditingController,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
      ),
    );
  }

  Widget _buildMovesInfo() {
    return Expanded(
      child: GridView.builder(
        itemCount: _searchMovies.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisExtent: 300,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  flex: 7,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetailScreen(
                              movieInfo: _searchMovies[index]),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0.5,
                            blurRadius: 9,
                          ),
                        ],
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            _searchMovies[index].posterUrl,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: TextInfoContainer(
                    padding: const EdgeInsets.all(8),
                    infoTxt: _searchMovies[index].title,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}