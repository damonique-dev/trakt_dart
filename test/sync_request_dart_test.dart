import 'dart:convert';
import 'dart:io';

import 'package:dotenv/dotenv.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:trakt_dart/trakt_dart.dart';

import 'setup_script.dart';

void main() {
  setUp(() {
    final env = DotEnv()..load();
    if (Keys.clientId(env) == null || Keys.clientSecret(env) == null) {
      throw Exception("Set the CLIENT_KEY and/or CLIENT_SECRET variables to run local tests");
    }
  });
  group("Sync Requests - ", () {
    test('Parse sync activities', () async {
      final file = File('test/test_data/latest_activities_response.json');
      final json = jsonDecode(await file.readAsString());
      final activities = SyncActivity.fromJsonModel(json);

      expect(activities.all, equals("2014-11-20T07:01:32.000Z"));
    });

    test('Parse playback progress - movies', () async {
      final file = File('test/test_data/playback_progress_movies_response.json');
      final json = jsonDecode(await file.readAsString());
      final progress = PlaybackProgress.fromJsonModel(json);

      expect(progress.movie!.title, equals("Batman Begins"));
    });

    test('Parse playback progress - shows', () async {
      final file = File('test/test_data/playback_progress_shows_response.json');
      final json = jsonDecode(await file.readAsString());
      final progress = PlaybackProgress.fromJsonModel(json);

      expect(progress.show!.title, equals("Breaking Bad"));
    });
  });
}
