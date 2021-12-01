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
  group("Comment Requests - ", () {
    test('Parse comment response', () async {
      final file = File('test/test_data/comment_response.json');
      final json = jsonDecode(await file.readAsString());
      final commentResponse = CommentResponse.fromJsonModel(json);

      expect(commentResponse.id, equals(190));
    });

    test('Get Comment', () async {
      final commment = await traktManager.comments.getComment("190");
      expect(
          commment.comment,
          equals(
              "Not as good as the 1979 original, but just as shocking, and just as satisfying to see her revenge"));
    });

    test('Get Comment Replies', () async {
      final replies = await traktManager.comments.getReplies("417");
      expect(replies.length, equals(6));
    });

    test('Get Comment Media Item', () async {
      final item = await traktManager.comments.getCommentMediaItem("417");
      expect(item.type, equals("movie"));
    });

    test('Get Comment Likes', () async {
      final likes = await traktManager.comments.getCommentLikes("417");
      expect(likes.length, equals(2));
    });

    test('Get Trending Comments', () async {
      final comments = await traktManager.comments.getTrendingComments();
      expect(comments.length, equals(10));
    });

    test('Get Trending Comments -  Show Reviews', () async {
      final comments = await traktManager.comments.getTrendingComments(
          mediaType: MediaType.shows, commentType: CommentType.reviews);
      expect(comments.length, equals(10));
    });

    test('Get Recent Comments', () async {
      final comments = await traktManager.comments.getRecentComments();
      expect(comments.length, equals(10));
    });

    test('Get Recent Comments -  Show Reviews', () async {
      final comments = await traktManager.comments.getRecentComments(
          mediaType: MediaType.shows, commentType: CommentType.reviews);
      expect(comments.length, equals(10));
    });

    test('Get Updated Comments', () async {
      final comments = await traktManager.comments.getUpdatedComments();
      expect(comments.length, equals(10));
    });

    test('Get Updated Comments -  Show Reviews', () async {
      final comments = await traktManager.comments.getUpdatedComments(
          mediaType: MediaType.shows, commentType: CommentType.reviews);
      expect(comments.length, equals(10));
    });
  });
}
