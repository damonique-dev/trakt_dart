import 'dart:convert';
import 'dart:io';

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
  group("User Requests - ", () {
    test('Parse user settings response', () async {
      final file = File('test/test_data/user_settings_response.json');
      final json = jsonDecode(await file.readAsString());
      final settings = UserSettings.fromJsonModel(json);

      expect(settings.user.username, equals("justin"));
    });

    test('Parse follow request response', () async {
      final file = File('test/test_data/follow_request_data.json');
      final json = jsonDecode(await file.readAsString());
      final request = FollowRequest.fromJsonModel(json);

      expect(request.id, equals(3));
    });

    test('Get Collected Items - movies', () async {
      final movies = await traktManager.users.getCollection(
          "sean", UserCollectionType.movies,
          extendedFull: true, extendedMetadata: true);
      expect(movies.length, isNonZero);
    });

    test('Get Collected Items - shows', () async {
      final movies = await traktManager.users.getCollection(
          "sean", UserCollectionType.shows,
          extendedFull: true, extendedMetadata: true);
      expect(movies.length, isNonZero);
    });

    test('Get User comments', () async {
      final comments = await traktManager.users
          .getComments("sean", extendedFull: true, includeReplies: "true");
      expect(comments.length, isNonZero);
    });

    test('Get User lists', () async {
      final lists = await traktManager.users.getLists("damoniquethomas1");
      expect(lists.length, isNonZero);
    });

    test('Get User followers', () async {
      final followers = await traktManager.users.getFollowers("sean");
      expect(followers.length, isNonZero);
    });

    test('Get User following', () async {
      final following = await traktManager.users.getFollowing("sean");
      expect(following.length, isNonZero);
    });

    test('Get User friends', () async {
      final friends = await traktManager.users.getFollowing("sean");
      expect(friends.length, isNonZero);
    });

    test('Get User watched history', () async {
      final history =
          await traktManager.users.getHistory("sean", extendedFull: true);
      expect(history.length, isNonZero);
    });

    test('Get User ratings', () async {
      final ratings = await traktManager.users.getRatings("sean",
          type: MediaType.movies, ratings: [3], extendedFull: true);
      expect(ratings.length, isNonZero);
    });

    test('Get User watchlist', () async {
      final watchlist = await traktManager.users.getWatchlist("sean",
          type: WatchedItemType.movies,
          sortBy: SortBy.rank,
          extendedFull: true);
      expect(watchlist.length, isNonZero);
    });

    test('Get User watched - movies', () async {
      final watched = await traktManager.users
          .getWatched("sean", MoviesShowsType.movies, extendedFull: true);
      expect(watched.length, isNonZero);
    });

    test('Get User watched - shows', () async {
      final watched = await traktManager.users
          .getWatched("sean", MoviesShowsType.shows, extendedFull: true);
      expect(watched.length, isNonZero);
    });

    test('Get User stats', () async {
      final stats = await traktManager.users.getStats("sean");
      expect(stats.movies.plays, isNonZero);
    });
  });
}
