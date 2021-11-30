import 'package:dotenv/dotenv.dart' show load;
import 'package:flutter_test/flutter_test.dart';

import 'package:trakt_dart/trakt_dart.dart';

import 'setup_script.dart';

void main() {
  late TraktManager traktManager;

  setUp(() {
    load();
    if (Keys.clientId == null || Keys.clientSecret == null) {
      throw Exception(
          "Set the CLIENT_KEY and/or CLIENT_SECRET variables to run local tests");
    }
    traktManager = TraktManager(
        clientId: Keys.clientId!,
        clientSecret: Keys.clientSecret!,
        redirectURI: "");
  });

  test('Get Genres - Movies', () async {
    final genres = await traktManager.genres.getGenres(GenreType.movies);
    expect(genres.length, equals(26));
  });

  test('Get Genres - Shows', () async {
    final genres = await traktManager.genres.getGenres(GenreType.shows);
    expect(genres.length, equals(36));
  });
}
