import 'package:dotenv/dotenv.dart' show load;
import 'package:flutter_test/flutter_test.dart';

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
        clientId: Keys.clientId!,
        clientSecret: Keys.clientSecret!,
        redirectURI: "");
  });

  test('Get Trending Lists', () async {
    final lists = await TraktManager.instance.getTrendingLists();
    expect(lists.length, equals(10));
  });

  test('Get Popular Lists', () async {
    final lists = await TraktManager.instance.getPopularLists();
    expect(lists.length, equals(10));
  });

  test('Get List', () async {
    final list = await TraktManager.instance.getList(55);
    expect(list.name, equals("AVP Collection"));
  });

  test('Get List Likes', () async {
    final likes = await TraktManager.instance.getListLikes(3837211);
    expect(likes.length, equals(20));
  });

  test('Get List Items', () async {
    final items =
        await TraktManager.instance.getListItems(3837211, extendedFull: true);
    expect(items.length, equals(300));
  });
}
