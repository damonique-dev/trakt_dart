import 'package:flutter/material.dart';
import 'package:trakt_dart/trakt_dart.dart';

void main() => runApp(TraktDartApp());

// ignore: must_be_immutable
class TraktDartApp extends StatelessWidget {
  late TraktManager traktManager;

  TraktDartApp({Key? key}) : super(key: key) {
    // Replace with your clientId and clientId from Trakt API.
    traktManager = TraktManager(
        clientId: "clientId", clientSecret: "clientId", redirectURI: "");
  }

  Future<List<TrendingMovie>> getTrendingMovies() {
    return traktManager.movies.getTrendingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Trending Movies'),
        ),
        body: FutureBuilder<List<TrendingMovie>>(
          future: getTrendingMovies(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }
            final trendingMovies = snapshot.data!;
            return ListView.builder(
              itemCount: trendingMovies.length,
              itemBuilder: (context, index) {
                final movie = trendingMovies[index];
                return Text(movie.movie.title);
              },
            );
          },
        ),
      ),
    );
  }
}
