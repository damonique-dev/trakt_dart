import 'package:dotenv/dotenv.dart' show load;
import 'package:flutter_test/flutter_test.dart';

import 'package:trakt_dart/trakt_dart.dart';

import 'setup_script.dart';

void main() {
  setUp(() {
    load();
    if (Keys.clientId == null || Keys.clientSecret == null) {
      throw Exception(
          "Set the CLIENT_KEY and/or CLIENT_SECRET variables in an .env file to run local tests");
    }
    TraktManager.instance.initializeTraktMananager(
        clientId: Keys.clientId!, clientSecret: Keys.clientSecret!);
  });

  test('Get Trending shows', () async {
    final shows = await TraktManager.instance.getTrendingShows();
    expect(shows.length, equals(10));
  });

  test('Get Popular shows', () async {
    final shows =
        await TraktManager.instance.getPopularShows(TimePeriod.weekly);
    expect(shows.length, equals(10));
  });

  test('Get Recommended shows', () async {
    final shows =
        await TraktManager.instance.getRecommendedShows(TimePeriod.weekly);
    expect(shows.length, equals(10));
  });

  test('Get Most Played shows', () async {
    final shows =
        await TraktManager.instance.getMostPlayedShows(TimePeriod.weekly);
    expect(shows.length, equals(10));
  });

  test('Get Most Watched shows', () async {
    final shows =
        await TraktManager.instance.getMostWatchedShows(TimePeriod.weekly);
    expect(shows.length, equals(10));
  });

  test('Get Most Collected shows', () async {
    final shows =
        await TraktManager.instance.getMostCollectedShows(TimePeriod.weekly);
    expect(shows.length, equals(10));
  });

  test('Get Most Anticipated shows', () async {
    final shows = await TraktManager.instance.getMostAnticipatedShows();
    expect(shows.length, equals(10));
  });

  test('Get Updated shows', () async {
    final shows = await TraktManager.instance
        .getUpdatedShows(DateTime.now().toIso8601String());
    expect(shows.length, lessThanOrEqualTo(10));
  });

  test('Get Updated show ids', () async {
    final ids = await TraktManager.instance
        .getUpdatedShowIds(DateTime.now().toIso8601String());
    expect(ids.length, lessThanOrEqualTo(10));
  });

  test('Get Show Summary', () async {
    final show = await TraktManager.instance
        .getShowSummary("game-of-thrones", extendedFull: true);
    expect(show.title, "Game of Thrones");
  });

  test('Get Show Aliases', () async {
    final aliases =
        await TraktManager.instance.getShowAliases("game-of-thrones");
    expect(aliases.length, equals(281));
  });

  // test('Get Show Certifications', () async {
  //   final certs =
  //       await TraktManager.instance.getShowCertifications("game-of-thrones");
  //   expect(certs.length, equals(10));
  // });

  test('Get Show Translations', () async {
    final translations =
        await TraktManager.instance.getShowTranslations("game-of-thrones");
    expect(translations.length, equals(46));
  });

  test('Get Show Comments', () async {
    final comments =
        await TraktManager.instance.getShowComments("game-of-thrones");
    expect(comments.length, equals(10));
  });

  test('Get Show Lists', () async {
    final lists = await TraktManager.instance.getShowLists("game-of-thrones");
    expect(lists.length, equals(10));
  });

  test('Get Show People', () async {
    final people = await TraktManager.instance.getShowPeople("game-of-thrones",
        extendedFull: true, includeGuestStars: true);
    expect(people.cast?.length, equals(44));
    expect(people.crew?.crew?.length, equals(4));
    expect(people.crew?.costumeAndMakeUp?.length, equals(3));
    expect(people.crew?.directing?.length, equals(22));
    expect(people.crew?.lighting, isNull);
    expect(people.crew?.production?.length, equals(22));
    expect(people.crew?.sound?.length, equals(2));
    expect(people.crew?.visualEffects?.length, equals(5));
    expect(people.crew?.writing?.length, equals(7));
    expect(people.crew?.camera?.length, equals(15));
    expect(people.crew?.art?.length, equals(9));
    expect(people.guestStars?.length, equals(507));
  });

  test('Get Show Rating', () async {
    final rating =
        await TraktManager.instance.getShowRatings("game-of-thrones");
    expect(rating.distribution.length, equals(10));
  });

  test('Get Related Show', () async {
    final shows = await TraktManager.instance.getRelatedShow("game-of-thrones");
    expect(shows.length, equals(10));
  });

  test('Get Show Stats ', () async {
    final stats = await TraktManager.instance.getShowStats("game-of-thrones");
    expect(stats.watchers, isNonZero);
    expect(stats.votes, isNonZero);
    expect(stats.recommended, isNonZero);
    expect(stats.plays, isNonZero);
    expect(stats.lists, isNonZero);
    expect(stats.comments, isNonZero);
    expect(stats.collectors, isNonZero);
  });

  test('Get Show Last Episode', () async {
    final episode =
        await TraktManager.instance.getShowLastEpisode("game-of-thrones");
    expect(episode.title, equals("The Iron Throne"));
  });
}
