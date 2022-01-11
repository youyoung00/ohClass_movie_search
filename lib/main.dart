import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movie_search/ui/screen/movie_screen.dart';
import 'package:movie_search/ui/screen_model/screen_view_model.dart';
import 'package:provider/provider.dart';

import 'data/movie_api_data.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<ScreenViewModel>(
        create: (_) => ScreenViewModel(MovieApi()),
        child: const MovieScreen(),
      ),
    );
  }
}
