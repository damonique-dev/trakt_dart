import 'dart:convert';
import 'dart:io';

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
}
