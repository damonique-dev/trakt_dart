import 'package:flutter_test/flutter_test.dart';
import 'package:trakt_dart/models/common_models.dart';

import 'package:trakt_dart/trakt_manager/trakt_manager.dart';

void main() {
  setUp(() {
    // if (Keys.clientId == null || Keys.clientSecret == null) {
    //   throw Exception(
    //       "Set the CLIENT_KEY and/or CLIENT_SECRET variables to run local tests");
    // }
    // TraktManager.instance.initializeTraktMananager(
    //     clientId: Keys.clientId!, clientSecret: Keys.clientSecret!);

    TraktManager.instance.initializeTraktMananager(
        clientId:
            "fc948ebe57e67356d97a1fba156d79b195fd22c6e953c3e4d4cb977dd536eb6d",
        clientSecret: "");
  });

  test('Get Show Seasons', () async {
    final seasons =
        await TraktManager.instance.getShowSeasons("game-of-thrones");
    expect(seasons.length, equals(9));
  });

  test('Get Show Season Summary', () async {
    final summary =
        await TraktManager.instance.getShowSeasonSummary("game-of-thrones", 1);
    expect(summary.length, equals(10));
  });

  test('Get Show Season Comments', () async {
    final comments =
        await TraktManager.instance.getShowSeasonComments("game-of-thrones", 1);
    expect(comments.length, equals(10));
  });

  test('Get Show Season Lists', () async {
    final lists =
        await TraktManager.instance.getShowSeasonLists("game-of-thrones", 1);
    expect(lists.length, equals(10));
  });

  test('Get Show Season Lists', () async {
    final people =
        await TraktManager.instance.getShowSeasonPeople("game-of-thrones", 1);
    expect(people.cast?.length, equals(19));
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
  });

  test('Get Show Season Ratings', () async {
    final rating =
        await TraktManager.instance.getShowSeasonRatings("game-of-thrones", 1);
    expect(rating.distribution.length, equals(10));
  });

  test('Get Show Season Stats', () async {
    final stats =
        await TraktManager.instance.getShowSeasonsStats("game-of-thrones", 1);
    expect(stats.watchers, isNonZero);
    expect(stats.votes, isNonZero);
    expect(stats.plays, isNonZero);
    expect(stats.lists, isNonZero);
    expect(stats.comments, isNonZero);
    expect(stats.collectors, isNonZero);
  });
}
