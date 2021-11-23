import 'package:flutter/material.dart';
import 'package:trakt_dart/trakt_dart.dart';

void main() => runApp(const TraktDartApp());

class TraktDartApp extends StatelessWidget {
  const TraktDartApp({Key? key}) : super(key: key);

  Future<List<TrendingMovie>> getTrendingMovies() {
    // Replace with your clientId and clientId from Trakt API.
    TraktManager.instance.initializeTraktMananager(
        clientId: "clientId", clientSecret: "clientId", redirectURI: "");

    return TraktManager.instance.getTrendingMovies();
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
