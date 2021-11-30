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
}
