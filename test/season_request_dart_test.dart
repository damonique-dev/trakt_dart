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
  group("Season Requests - ", () {
    test('Get Show Seasons', () async {
      final seasons = await traktManager.seasons.getShowSeasons("game-of-thrones");
      expect(seasons.length, equals(9));
    });

    test('Get Show Season Summary', () async {
      final summary = await traktManager.seasons.getShowSeasonSummary("game-of-thrones", 1, extendedFull: true);
      expect(summary.length, equals(10));
    });

    test('Get Show Season Comments', () async {
      final comments = await traktManager.seasons.getShowSeasonComments("game-of-thrones", 1);
      expect(comments.length, equals(10));
    });

    test('Get Show Season Lists', () async {
      final lists = await traktManager.seasons.getShowSeasonLists("game-of-thrones", 1);
      expect(lists.length, equals(10));
    });

    test('Get Show Season People', () async {
      final people = await traktManager.seasons
          .getShowSeasonPeople("game-of-thrones", 1, extendedFull: true, includeGuestStars: true);
      expect(people.cast?.length, isNonZero);
      expect(people.crew?.crew, isNull);
      expect(people.crew?.costumeAndMakeUp?.length, equals(1));
      expect(people.crew?.directing?.length, equals(4));
      expect(people.crew?.lighting, isNull);
      expect(people.crew?.production?.length, equals(12));
      expect(people.crew?.sound?.length, equals(1));
      expect(people.crew?.visualEffects, isNull);
      expect(people.crew?.writing?.length, equals(5));
      expect(people.crew?.camera?.length, equals(3));
      expect(people.crew?.art?.length, equals(2));
      expect(people.guestStars?.length, isNonZero);
    });

    test('Get Show Season Ratings', () async {
      final rating = await traktManager.seasons.getShowSeasonRatings("game-of-thrones", 1);
      expect(rating.distribution.length, equals(10));
    });

    test('Get Show Season Stats', () async {
      final stats = await traktManager.seasons.getShowSeasonsStats("game-of-thrones", 1);
      expect(stats.watchers, isNonZero);
      expect(stats.votes, isNonZero);
      expect(stats.plays, isNonZero);
      expect(stats.lists, isNonZero);
      expect(stats.comments, isNonZero);
      expect(stats.collectors, isNonZero);
    });
  });
}
