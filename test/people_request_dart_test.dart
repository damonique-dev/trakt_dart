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

  test('Get Person Summary', () async {
    final person = await TraktManager.instance
        .getPersonSummary("ryan-reynolds", extendedFull: true);
    expect(person.name, equals("Ryan Reynolds"));
  });

  test('Get Person Movie Credits', () async {
    final personMovies = await TraktManager.instance
        .getPersonMovieCredits("ryan-reynolds", extendedFull: true);
    expect(personMovies.cast.length, equals(92));
    expect(personMovies.crew.crew, isNull);
    expect(personMovies.crew.costumeAndMakeUp, isNull);
    expect(personMovies.crew.directing, isNull);
    expect(personMovies.crew.lighting, isNull);
    expect(personMovies.crew.production?.length, equals(13));
    expect(personMovies.crew.sound, isNull);
    expect(personMovies.crew.visualEffects, isNull);
    expect(personMovies.crew.writing?.length, equals(4));
    expect(personMovies.crew.camera, isNull);
    expect(personMovies.crew.art, isNull);
  });

  test('Get Person Show Credits', () async {
    final personShows = await TraktManager.instance
        .getPersonShowCredits("ryan-reynolds", extendedFull: true);
    expect(personShows.cast.length, equals(26));
    expect(personShows.crew.crew, isNull);
    expect(personShows.crew.costumeAndMakeUp, isNull);
    expect(personShows.crew.directing, isNull);
    expect(personShows.crew.lighting, isNull);
    expect(personShows.crew.production?.length, equals(1));
    expect(personShows.crew.sound, isNull);
    expect(personShows.crew.visualEffects, isNull);
    expect(personShows.crew.writing, isNull);
    expect(personShows.crew.camera, isNull);
    expect(personShows.crew.art, isNull);
  });

  test('Get People Lists', () async {
    final lists = await TraktManager.instance.getPersonLists("ryan-reynolds");
    expect(lists.length, equals(10));
  });
}
