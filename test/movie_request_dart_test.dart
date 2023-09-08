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
  group("Movie Requests - ", () {
    test('Get Trending Movie', () async {
      final movies = await traktManager.movies.getTrendingMovies(extendedFull: true);
      expect(movies.length, equals(10));
    });

    test('Get Popular Movie', () async {
      final movies = await traktManager.movies.getPopularMovies(extendedFull: true);
      expect(movies.length, equals(10));
    });

    test('Get Most Played Movies', () async {
      final movies = await traktManager.movies.getMostPlayedMovies(TimePeriod.weekly);
      expect(movies.length, equals(10));
    });

    test('Get Most Watched Movies', () async {
      final movies = await traktManager.movies.getMostWatchedMovies(TimePeriod.weekly);
      expect(movies.length, equals(10));
    });

    test('Get Most Collected Movies', () async {
      final movies = await traktManager.movies.getMostCollectedMovies(TimePeriod.weekly);
      expect(movies.length, equals(10));
    });

    test('Get Most Anticipated Movies', () async {
      final movies = await traktManager.movies.getMostAnticipatedMovies();
      expect(movies.length, equals(10));
    });

    test('Get Box Office Movies', () async {
      final movies = await traktManager.movies.getBoxOfficeMovies();
      expect(movies.length, equals(10));
    });

    test('Get Updated Movies', () async {
      final movies = await traktManager.movies.getUpdatedMovies(DateTime.now().toIso8601String());
      expect(movies.length, lessThanOrEqualTo(10));
    });

    test('Get Updated Movie Ids', () async {
      final moviesIds = await traktManager.movies.getUpdatedMovieIds(DateTime.now().toIso8601String());
      expect(moviesIds.length, lessThanOrEqualTo(10));
    });

    test('Get Single Movie', () async {
      final movie = await traktManager.movies.getMovieSummary("deadpool-2016", extendedFull: true);

      expect(movie.title, equals("Deadpool"));
    });

    test('Get Movie Aliases', () async {
      final aliases = await traktManager.movies.getMovieAliases("deadpool-2016");
      expect(aliases.length, greaterThan(0));
    });

    test('Get Movie Releases', () async {
      final releases = await traktManager.movies.getMovieReleases("deadpool-2016", "us");
      expect(releases.length, greaterThan(0));
    });

    test('Get Movie Translations', () async {
      final translations = await traktManager.movies.getMovieTranslations("deadpool-2016", language: "es");
      expect(translations.length, greaterThan(0));
    });

    test('Get Movie Comments', () async {
      final comments = await traktManager.movies.getMovieComments("deadpool-2016");
      expect(comments.length, greaterThan(0));
    });

    test('Get Movie Lists', () async {
      final lists = await traktManager.movies.getMovieLists("deadpool-2016");
      expect(lists.length, greaterThan(0));
    });

    test('Get Movie People', () async {
      final people = await traktManager.movies.getMoviePeople("deadpool-2016");
      expect(people.cast?.length, greaterThan(0));
      expect(people.crew?.crew?.length, greaterThan(0));
      expect(people.crew?.costumeAndMakeUp?.length, greaterThan(0));
      expect(people.crew?.directing?.length, greaterThan(0));
      expect(people.crew?.lighting?.length, greaterThan(0));
      expect(people.crew?.production?.length, greaterThan(0));
      expect(people.crew?.sound?.length, greaterThan(0));
      expect(people.crew?.visualEffects?.length, greaterThan(0));
      expect(people.crew?.writing?.length, greaterThan(0));
      expect(people.crew?.camera?.length, greaterThan(0));
      expect(people.crew?.art?.length, greaterThan(0));
    });

    test('Get Movie Ratings', () async {
      final ratings = await traktManager.movies.getMovieRatings("deadpool-2016");
      expect(ratings.distribution.length, equals(10));
    });

    test('Get Related Movies', () async {
      final movies = await traktManager.movies.getRelatedMovie("deadpool-2016");
      expect(movies.length, equals(10));
    });

    test('Get Movie Stats', () async {
      final stats = await traktManager.movies.getMovieStats("deadpool-2016");
      expect(stats.watchers, isNonZero);
      expect(stats.votes, isNonZero);
      expect(stats.recommended, isNonZero);
      expect(stats.plays, isNonZero);
      expect(stats.lists, isNonZero);
      expect(stats.comments, isNonZero);
      expect(stats.collectors, isNonZero);
    });
  });
}
