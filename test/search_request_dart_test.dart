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
  group("Search Requests - ", () {
    test('Search text query', () async {
      final searchResults = await traktManager.search.searchTextQuery(
          "tron", [SearchType.movie, SearchType.show, SearchType.episode, SearchType.list, SearchType.person],
          extendedFull: true);
      expect(searchResults.length, equals(11));
    });

    test('Search ids', () async {
      final searchResults = await traktManager.search.searchIds(SearchIdType.trakt, "12601", extendedFull: true);
      expect(searchResults.length, equals(3));
    });
  });
}
