import 'dart:convert';
import 'dart:io';

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
  group("Scrobble Requests - ", () {
    test('Parse scrobble movie response', () async {
      final file = File('test/test_data/scrobble_movie_response.json');
      final json = jsonDecode(await file.readAsString());
      final scrobble = ScrobbleResponse.fromJsonModel(json);

      expect(scrobble.id, equals(0));
    });

    test('Parse scrobble episode response', () async {
      final file = File('test/test_data/scrobble_episode_response.json');
      final json = jsonDecode(await file.readAsString());
      final scrobble = ScrobbleResponse.fromJsonModel(json);

      expect(scrobble.id, equals(0));
    });
  });
}
