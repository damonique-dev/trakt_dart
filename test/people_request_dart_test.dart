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
  group("People Requests - ", () {
    test('Get Person Summary', () async {
      final person = await traktManager.people.getPersonSummary("ryan-reynolds", extendedFull: true);
      expect(person.name, equals("Ryan Reynolds"));
    });

    test('Get Person Movie Credits', () async {
      final personMovies = await traktManager.people.getPersonMovieCredits("ryan-reynolds", extendedFull: true);
      expect(personMovies.cast.length, greaterThan(0));
      expect(personMovies.crew.crew, isNull);
      expect(personMovies.crew.costumeAndMakeUp, isNull);
      expect(personMovies.crew.directing, isNull);
      expect(personMovies.crew.lighting, isNull);
      expect(personMovies.crew.production?.length, greaterThan(0));
      expect(personMovies.crew.sound, isNull);
      expect(personMovies.crew.visualEffects, isNull);
      expect(personMovies.crew.writing?.length, greaterThan(0));
      expect(personMovies.crew.camera, isNull);
      expect(personMovies.crew.art, isNull);
    });

    test('Get Person Show Credits', () async {
      final personShows = await traktManager.people.getPersonShowCredits("ryan-reynolds", extendedFull: true);
      expect(personShows.cast.length, greaterThan(0));
      expect(personShows.crew.crew, isNull);
      expect(personShows.crew.costumeAndMakeUp, isNull);
      expect(personShows.crew.directing, isNull);
      expect(personShows.crew.lighting, isNull);
      expect(personShows.crew.production?.length, greaterThan(0));
      expect(personShows.crew.sound, isNull);
      expect(personShows.crew.visualEffects, isNull);
      expect(personShows.crew.writing, isNull);
      expect(personShows.crew.camera, isNull);
      expect(personShows.crew.art, isNull);
    });

    test('Get People Lists', () async {
      final lists = await traktManager.people.getPersonLists("ryan-reynolds");
      expect(lists.length, greaterThan(0));
    });
  });
}
