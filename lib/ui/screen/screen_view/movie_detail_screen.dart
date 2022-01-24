import 'package:flutter/material.dart';
import 'package:movie_search/model/movies_all_data.dart';
import 'package:movie_search/ui/screen/screen_widget/custom_ele_btn_widget.dart';
import 'package:movie_search/ui/screen/screen_widget/text_info_container_widget.dart';
import 'package:movie_search/ui/screen_model/widget_model/custom_ele_btn_model.dart';

class MovieDetailScreen extends StatelessWidget {
  final MovieInfo movieInfo;

  const MovieDetailScreen({Key? key, required this.movieInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(movieInfo.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.topLeft,
                child: Text(
                  movieInfo.title,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Image.network(movieInfo.posterUrl),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(movieInfo.releaseDate.toString()),
                        Row(
                          children: eleBtnModels
                              .map<Widget>((e) => CustomEleButton(
                                    onClick: () {},
                                    btnIcon: e.btnIcon,
                                    btnString: movieInfo.voteAverage.toString(),
                                    btnPadding: e.btnPadding,
                                  ))
                              .toList(),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            TextInfoContainer(
              padding: const EdgeInsets.all(16),
              infoTxt: movieInfo.overview,
            ),
          ],
        ),
      ),
    );
  }
}
