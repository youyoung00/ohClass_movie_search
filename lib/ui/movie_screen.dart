import 'package:flutter/material.dart';
import 'package:movie_search/data/movie_api_data.dart';
import 'package:movie_search/model/movies_all_data.dart';
import 'package:movie_search/ui/movie_detail_screen.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  final _textEditingController = TextEditingController();

  List<MovieInfo> _movies = [];
  List<MovieInfo> _originMovies = [];
  final _api = MovieApi();

  @override
  void initState() {
    super.initState();
    _showResult();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  Future<void> _showResult() async {
    List<MovieInfo> movies = await _api.fetchPhotos();
    setState(() {
      _movies = movies;
      _originMovies = _movies;
    });
  }

  @override
  Widget build(BuildContext context) {
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
      onChanged: (input) {
        // _originMovies.clear();
        setState(() {
          _originMovies = _movies
              .where((movieInfo) => movieInfo.title.contains(input))
              .toList();
          print(_originMovies);
        });
        // print(_movies);
      },
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
        itemCount: _originMovies.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisExtent: 260,
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
                              movieInfo: _originMovies[index]),
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
                            _originMovies[index].posterUrl,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        _originMovies[index].title,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
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
