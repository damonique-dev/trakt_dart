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

  group("List Requests - ", () {
    test('Get Trending Lists', () async {
      final lists = await traktManager.lists.getTrendingLists();
      expect(lists.length, equals(10));
    });

    test('Get Popular Lists', () async {
      final lists = await traktManager.lists.getPopularLists();
      expect(lists.length, equals(10));
    });

    test('Get List', () async {
      final list = await traktManager.lists.getList(55);
      expect(list.name, equals("AVP Collection"));
    });

    test('Get List Likes', () async {
      final likes = await traktManager.lists.getListLikes(3837211);
      expect(likes.length, greaterThan(0));
    });

    test('Get List Items', () async {
      final items = await traktManager.lists.getListItems(3837211, extendedFull: true);
      expect(items.length, isNonZero);
    });
  });
}
