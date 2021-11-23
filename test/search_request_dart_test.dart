import 'package:dotenv/dotenv.dart' show load;
import 'package:flutter_test/flutter_test.dart';

import 'package:trakt_dart/trakt_dart.dart';

import 'setup_script.dart';

void main() {
  setUp(() {
    load();
    if (Keys.clientId == null || Keys.clientSecret == null) {
      throw Exception(
          "Set the CLIENT_KEY and/or CLIENT_SECRET variables to run local tests");
    }
    TraktManager.instance.initializeTraktMananager(
        clientId: Keys.clientId!,
        clientSecret: Keys.clientSecret!,
        redirectURI: "");
  });

  test('Search text query', () async {
    final searchResults = await TraktManager.instance.searchTextQuery(
        "tron",
        [
          SearchType.movie,
          SearchType.show,
          SearchType.episode,
          SearchType.list,
          SearchType.person
        ],
        extendedFull: true);
    expect(searchResults.length, equals(11));
  });

  test('Search ids', () async {
    final searchResults = await TraktManager.instance
        .searchIds(SearchIdType.trakt, "12601", extendedFull: true);
    expect(searchResults.length, equals(3));
  });
}
