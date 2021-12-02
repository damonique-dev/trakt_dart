import 'package:dotenv/dotenv.dart' show load;
import 'package:flutter_test/flutter_test.dart';

import 'package:trakt_dart/trakt_dart.dart';

import 'setup_script.dart';

void main() {
  late TraktManager traktManager;

  setUp(() {
    load();
    if (Keys.clientId == null || Keys.clientSecret == null) {
      throw Exception(
          "Set the CLIENT_KEY and/or CLIENT_SECRET variables to run local tests");
    }
    traktManager = TraktManager(
        clientId: Keys.clientId!,
        clientSecret: Keys.clientSecret!,
        redirectURI: "");
  });
  group("Movie Requests - ", () {
    test('Get Trending Movie', () async {
      final movies = await traktManager.movies.getTrendingMovies();
      expect(movies.length, equals(10));
    });

    test('Get Popular Movie', () async {
      final movies =
          await traktManager.movies.getPopularMovies(TimePeriod.weekly);
      expect(movies.length, equals(10));
    });

    test('Get Most Played Movies', () async {
      final movies =
          await traktManager.movies.getMostPlayedMovies(TimePeriod.weekly);
      expect(movies.length, equals(10));
    });

    test('Get Most Watched Movies', () async {
      final movies =
          await traktManager.movies.getMostWatchedMovies(TimePeriod.weekly);
      expect(movies.length, equals(10));
    });

    test('Get Most Collected Movies', () async {
      final movies =
          await traktManager.movies.getMostCollectedMovies(TimePeriod.weekly);
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
      final movies = await traktManager.movies
          .getUpdatedMovies(DateTime.now().toIso8601String());
      expect(movies.length, lessThanOrEqualTo(10));
    });

    test('Get Updated Movie Ids', () async {
      final moviesIds = await traktManager.movies
          .getUpdatedMovieIds(DateTime.now().toIso8601String());
      expect(moviesIds.length, lessThanOrEqualTo(10));
    });

    test('Get Single Movie', () async {
      final movie = await traktManager.movies
          .getMovieSummary("deadpool-2016", extendedFull: true);

      expect(movie.title, equals("Deadpool"));
    });

    test('Get Movie Aliases', () async {
      final aliases =
          await traktManager.movies.getMovieAliases("deadpool-2016");
      expect(aliases.length, equals(18));
    });

    test('Get Movie Releases', () async {
      final releases =
          await traktManager.movies.getMovieReleases("deadpool-2016", "us");
      expect(releases.length, equals(2));
    });

    test('Get Movie Translations', () async {
      final translations = await traktManager.movies
          .getMovieTranslations("deadpool-2016", language: "da");
      expect(translations.length, equals(2));
    });

    test('Get Movie Comments', () async {
      final comments =
          await traktManager.movies.getMovieComments("deadpool-2016");
      expect(comments.length, equals(10));
    });

    test('Get Movie Lists', () async {
      final lists = await traktManager.movies.getMovieLists("deadpool-2016");
      expect(lists.length, equals(10));
    });

    test('Get Movie People', () async {
      final people = await traktManager.movies.getMoviePeople("deadpool-2016");
      expect(people.cast?.length, equals(35));
      expect(people.crew?.crew?.length, equals(47));
      expect(people.crew?.costumeAndMakeUp?.length, equals(32));
      expect(people.crew?.directing?.length, equals(12));
      expect(people.crew?.lighting?.length, equals(27));
      expect(people.crew?.production?.length, equals(32));
      expect(people.crew?.sound?.length, equals(36));
      expect(people.crew?.visualEffects?.length, equals(141));
      expect(people.crew?.writing?.length, equals(5));
      expect(people.crew?.camera?.length, equals(51));
      expect(people.crew?.art?.length, equals(34));
    });

    test('Get Movie Ratings', () async {
      final ratings =
          await traktManager.movies.getMovieRatings("deadpool-2016");
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
