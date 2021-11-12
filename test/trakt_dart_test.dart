import 'dart:developer';

import 'package:flutter_test/flutter_test.dart';
import 'package:trakt_dart/models/common_models.dart';
import 'package:trakt_dart/models/movie_models.dart';

import 'package:trakt_dart/trakt_manager/trakt_manager.dart';

void main() {

  setUp(() {
    TraktManager.instance.initializeTraktMananager(clientId: "fc948ebe57e67356d97a1fba156d79b195fd22c6e953c3e4d4cb977dd536eb6d", clientSecret: "clientSecret");
  });
  group('Movies', () {
    test('Get Trending', () async{
      final movies = await TraktManager.instance.getTrendingMovies();
      expect(movies.length, equals(10));
    });

    test('Get Single', () async{
      final movie = await TraktManager.instance.getMovieSummary("tron-legacy-2010");

      expect(movie.title, equals("TRON: Legacy"));
    });

  });
}
