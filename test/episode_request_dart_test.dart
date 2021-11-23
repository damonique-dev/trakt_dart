import 'package:flutter_test/flutter_test.dart';
import 'package:dotenv/dotenv.dart' show load;
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
        clientId: Keys.clientId!, clientSecret: Keys.clientSecret!);
  });

  test('Get Show Episode Summary', () async {
    final episode = await TraktManager.instance
        .getEpisodeSummary("game-of-thrones", 1, 1, extendedFull: true);
    expect(episode.title, equals("Winter Is Coming"));
  });

  test('Get Show Episode Translations', () async {
    final translations = await TraktManager.instance
        .getEpisodeTranslations("game-of-thrones", 1, 1);
    expect(translations.length, equals(46));
  });

  test('Get Show Episode Comments', () async {
    final comments =
        await TraktManager.instance.getEpisodeComments("game-of-thrones", 1, 1);
    expect(comments.length, equals(10));
  });

  test('Get Show Episodes Lists', () async {
    final lists =
        await TraktManager.instance.getEpisodeLists("game-of-thrones", 1, 1);
    expect(lists.length, equals(10));
  });

  test('Get Show Episode People', () async {
    final people = await TraktManager.instance.getEpisodePeople(
        "game-of-thrones", 1, 1,
        extendedFull: true, includeGuestStars: true);
    expect(people.cast?.length, equals(18));
    expect(people.crew?.crew, isNull);
    expect(people.crew?.costumeAndMakeUp, isNull);
    expect(people.crew?.directing?.length, equals(1));
    expect(people.crew?.lighting, isNull);
    expect(people.crew?.production, isNull);
    expect(people.crew?.sound, isNull);
    expect(people.crew?.visualEffects, isNull);
    expect(people.crew?.writing?.length, equals(2));
    expect(people.crew?.camera?.length, equals(1));
    expect(people.crew?.art, isNull);
    expect(people.guestStars?.length, equals(21));
  });

  test('Get Show Episode Ratings', () async {
    final rating =
        await TraktManager.instance.getEpisodeRatings("game-of-thrones", 1, 1);
    expect(rating.distribution.length, equals(10));
  });

  test('Get Show Episode Stats', () async {
    final stats =
        await TraktManager.instance.getEpisodeStats("game-of-thrones", 1, 1);
    expect(stats.watchers, isNonZero);
    expect(stats.votes, isNonZero);
    expect(stats.plays, isNonZero);
    expect(stats.lists, isNonZero);
    expect(stats.comments, isNonZero);
    expect(stats.collectors, isNonZero);
  });
}
