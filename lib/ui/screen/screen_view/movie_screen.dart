import 'package:flutter/material.dart';
import 'package:movie_search/model/movies_all_data.dart';
import 'package:movie_search/ui/screen/screen_view/movie_detail_screen.dart';
import 'package:movie_search/ui/screen/screen_widget/text_info_container_widget.dart';
import 'package:movie_search/ui/screen_model/view_model/screen_view_model.dart';
import 'package:provider/provider.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  final _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ScreenViewModel>().showResult();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

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
          _buildTextField(onChanged: (value) {
            viewModel.onQueryChanged(value);
          }),
          _buildMovesInfo(movieInfo: viewModel.searchMovies),
        ],
      ),
    );
  }

  Widget _buildTextField({Function(String)? onChanged}) {
    return TextFormField(
      onChanged: onChanged, //viewModel.onQueryChanged,
      controller: _textEditingController,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
      ),
    );
  }

  Widget _buildMovesInfo({required List<MovieInfo> movieInfo}) {
    return Expanded(
      child: GridView.builder(
        itemCount: movieInfo.length,
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
                          builder: (context) =>
                              MovieDetailScreen(movieInfo: movieInfo[index]),
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
                            movieInfo[index].posterUrl,
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
                    infoTxt: movieInfo[index].title,
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
