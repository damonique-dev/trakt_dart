import 'dart:convert';
import 'dart:io';

import 'package:dotenv/dotenv.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:trakt_dart/trakt_dart.dart';

import 'setup_script.dart';

void main() {
  setUp(() {
    final env = DotEnv()..load();
    if (Keys.clientId(env) == null) {
      throw Exception("Set the CLIENT_KEY and/or CLIENT_SECRET variables to run local tests");
    }
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
