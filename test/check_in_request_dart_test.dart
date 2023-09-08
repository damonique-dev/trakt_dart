import 'dart:convert';
import 'dart:io';

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
  group("Checkin Requests - ", () {
    test('Checkin assertions - both null', () async {
      expect(() async {
        await traktManager.checkIn.checkIn(movie: null, episode: null, appDate: '', appVersion: '');
      }, throwsAssertionError);
    });

    test('Checkin assertions - both provided', () async {
      final movie = await traktManager.movies.getMovieSummary("deadpool-2016");
      final episode = await traktManager.episodes.getEpisodeSummary("game-of-thrones", 1, 1);
      expect(() async {
        await traktManager.checkIn.checkIn(movie: movie, episode: episode, appDate: '', appVersion: '');
      }, throwsAssertionError);
    });

    test('Parse checkin movie response', () async {
      final file = File('test/test_data/check_in_movie_response.json');
      final json = jsonDecode(await file.readAsString());
      final checkInMovie = CheckInResponse.fromJsonModel(json);

      expect(checkInMovie.id, equals(3373536619));
    });

    test('Parse checkin episode response', () async {
      final file = File('test/test_data/check_in_episode_response.json');
      final json = jsonDecode(await file.readAsString());
      final checkInEpisode = CheckInResponse.fromJsonModel(json);

      expect(checkInEpisode.id, equals(3373536620));
    });
  });
}
