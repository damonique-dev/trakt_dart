import 'package:dotenv/dotenv.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:trakt_dart/trakt_dart.dart';

import 'setup_script.dart';

void main() {
  late TraktManager traktManager;

  setUp(() {
    final env = DotEnv()..load();
    if (Keys.clientId(env) == null || Keys.clientSecret(env) == null) {
      throw Exception("Set the CLIENT_KEY and/or CLIENT_SECRET variables to run local tests");
    }
    traktManager = TraktManager(clientId: Keys.clientId(env)!, clientSecret: Keys.clientSecret(env)!, redirectURI: "");
  });
  group("Genre Requests - ", () {
    test('Get Genres - Movies', () async {
      final genres = await traktManager.genres.getGenres(MoviesShowsType.movies);
      expect(genres.length, greaterThan(0));
    });

    test('Get Genres - Shows', () async {
      final genres = await traktManager.genres.getGenres(MoviesShowsType.shows);
      expect(genres.length, greaterThan(0));
    });
  });
}
