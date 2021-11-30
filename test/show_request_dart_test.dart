import 'dart:convert';
import 'dart:io';

import 'package:dotenv/dotenv.dart' show load;
import 'package:flutter/services.dart';
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

  test('Get Trending shows', () async {
    final shows = await traktManager.shows.getTrendingShows();
    expect(shows.length, equals(10));
  });

  test('Get Popular shows', () async {
    final shows = await traktManager.shows.getPopularShows();
    expect(shows.length, equals(10));
  });

  test('Get Recommended shows', () async {
    final shows =
        await traktManager.shows.getRecommendedShows(TimePeriod.weekly);
    expect(shows.length, equals(10));
  });

  test('Get Most Played shows', () async {
    final shows =
        await traktManager.shows.getMostPlayedShows(TimePeriod.weekly);
    expect(shows.length, equals(10));
  });

  test('Get Most Watched shows', () async {
    final shows =
        await traktManager.shows.getMostWatchedShows(TimePeriod.weekly);
    expect(shows.length, equals(10));
  });

  test('Get Most Collected shows', () async {
    final shows =
        await traktManager.shows.getMostCollectedShows(TimePeriod.weekly);
    expect(shows.length, equals(10));
  });

  test('Get Most Anticipated shows', () async {
    final shows = await traktManager.shows.getMostAnticipatedShows();
    expect(shows.length, equals(10));
  });

  test('Get Updated shows', () async {
    final shows = await traktManager.shows
        .getUpdatedShows(DateTime.now().toIso8601String());
    expect(shows.length, lessThanOrEqualTo(10));
  });

  test('Get Updated show ids', () async {
    final ids = await traktManager.shows
        .getUpdatedShowIds(DateTime.now().toIso8601String());
    expect(ids.length, lessThanOrEqualTo(10));
  });

  test('Get Show Summary', () async {
    final show = await traktManager.shows
        .getShowSummary("game-of-thrones", extendedFull: true);
    expect(show.title, "Game of Thrones");
  });

  test('Get Show Aliases', () async {
    final aliases = await traktManager.shows.getShowAliases("game-of-thrones");
    expect(aliases.length, isNonZero);
  });

  // test('Get Show Certifications', () async {
  //   final certs =
  //       await traktManager.shows.getShowCertifications("game-of-thrones");
  //   expect(certs.length, equals(10));
  // });

  test('Get Show Translations', () async {
    final translations =
        await traktManager.shows.getShowTranslations("game-of-thrones");
    expect(translations.length, equals(46));
  });

  test('Get Show Comments', () async {
    final comments =
        await traktManager.shows.getShowComments("game-of-thrones");
    expect(comments.length, equals(10));
  });

  test('Get Show Lists', () async {
    final lists = await traktManager.shows.getShowLists("game-of-thrones");
    expect(lists.length, equals(10));
  });

  test('Get Show People', () async {
    final people = await traktManager.shows.getShowPeople("game-of-thrones",
        extendedFull: true, includeGuestStars: true);
    expect(people.cast?.length, isNonZero);
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
    expect(people.guestStars?.length, isNonZero);
  });

  test('Get Show Rating', () async {
    final rating = await traktManager.shows.getShowRatings("game-of-thrones");
    expect(rating.distribution.length, equals(10));
  });

  test('Get Related Show', () async {
    final shows = await traktManager.shows.getRelatedShow("game-of-thrones");
    expect(shows.length, equals(10));
  });

  test('Get Show Stats ', () async {
    final stats = await traktManager.shows.getShowStats("game-of-thrones");
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
        await traktManager.shows.getShowLastEpisode("game-of-thrones");
    expect(episode.title, equals("The Iron Throne"));
  });

  test('Parse Show Collection Progress', () async {
    final file = File('test/test_data/show_collection_progress.json');
    final json = jsonDecode(await file.readAsString());
    final showCollectionProgress = ShowCollectionProgress.fromJsonModel(json);

    expect(showCollectionProgress.aired, equals(8));
    expect(showCollectionProgress.seasons.length, equals(1));
    expect(showCollectionProgress.seasons[0].episodes.length, equals(8));
    expect(showCollectionProgress.hiddenSeasons!.length, equals(1));
    expect(showCollectionProgress.nextEpisode, isNotNull);
    expect(showCollectionProgress.lastEpisode, isNotNull);
  });

  test('Parse Show Watched Progress', () async {
    final file = File('test/test_data/show_watched_progress.json');
    final json = jsonDecode(await file.readAsString());
    final showWatchedProgress = ShowWatchedProgress.fromJsonModel(json);

    expect(showWatchedProgress.aired, equals(8));
    expect(showWatchedProgress.resetAt, isNull);
    expect(showWatchedProgress.seasons.length, equals(1));
    expect(showWatchedProgress.seasons[0].episodes.length, equals(8));
    expect(showWatchedProgress.hiddenSeasons!.length, equals(1));
    expect(showWatchedProgress.nextEpisode, isNotNull);
    expect(showWatchedProgress.lastEpisode, isNotNull);
  });
}
