import 'package:flutter_test/flutter_test.dart';
import 'package:dotenv/dotenv.dart';
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
  group("Episode Requests - ", () {
    test('Get Show Episode Summary', () async {
      final episode = await traktManager.episodes.getEpisodeSummary("game-of-thrones", 1, 1, extendedFull: true);
      expect(episode.title, equals("Winter Is Coming"));
    });

    test('Get Show Episode Translations', () async {
      final translations = await traktManager.episodes.getEpisodeTranslations("game-of-thrones", 1, 1);
      expect(translations.length, greaterThan(0));
    });

    test('Get Show Episode Comments', () async {
      final comments = await traktManager.episodes.getEpisodeComments("game-of-thrones", 1, 1);
      expect(comments.length, equals(10));
    });

    test('Get Show Episodes Lists', () async {
      final lists = await traktManager.episodes.getEpisodeLists("game-of-thrones", 1, 1);
      expect(lists.length, equals(10));
    });

    test('Get Show Episode People', () async {
      final people = await traktManager.episodes
          .getEpisodePeople("game-of-thrones", 1, 1, extendedFull: true, includeGuestStars: true);
      expect(people.cast?.length, greaterThan(0));
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
      final rating = await traktManager.episodes.getEpisodeRatings("game-of-thrones", 1, 1);
      expect(rating.distribution.length, equals(10));
    });

    test('Get Show Episode Stats', () async {
      final stats = await traktManager.episodes.getEpisodeStats("game-of-thrones", 1, 1);
      expect(stats.watchers, isNonZero);
      expect(stats.votes, isNonZero);
      expect(stats.plays, isNonZero);
      expect(stats.lists, isNonZero);
      expect(stats.comments, isNonZero);
      expect(stats.collectors, isNonZero);
    });
  });
}
