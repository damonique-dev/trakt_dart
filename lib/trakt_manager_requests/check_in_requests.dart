part of trakt_dart;

class CheckIn extends Category {
  CheckIn(TraktManager manager) : super(manager);

  /// Check into a movie or episode.
  ///
  /// This should be tied to a user action to manually indicate they are watching something.
  /// The item will display as watching on the site, then automatically switch to watched status once the duration has elapsed.
  /// A unique history id (64-bit integer) will be returned and can be used to reference this checkin directly.
  ///
  /// The sharing object is optional and will apply the user's settings if not sent.
  /// If sharing is sent, each key will override the user's setting for that social network.
  /// Send true to post or false to not post on the indicated social network.
  /// You can see which social networks a user has connected with the /users/settings method.
  ///
  /// [movie, episode] - The item to checkin
  /// [message] - Message used for sharing. If not sent, it will use the watching string in the user settings.
  /// [appVersion] - Version number of the app.
  /// [appDate] - Build date of the app.
  /// [sharing] - Control sharing to any connected social networks.
  ///
  /// 🔒 OAuth Required
  Future<CheckInResponse> checkIn({
    String? appVersion,
    String? appDate,
    Movie? movie,
    Episode? episode,
    String? message,
    CheckInSharing? sharing,
  }) async {
    assert((movie != null || episode != null),
        "A movie or episode must be provided");
    assert((movie == null || episode == null),
        "Cannot check in a movie and episode in one request.");
    Map<String, dynamic> body = {};

    if (movie != null) {
      body["movie"] = {
        "title": movie.title,
        "year": movie.year,
        "ids": movie.ids,
      };
    } else {
      body["episode"] = {
        "ids": episode!.ids,
      };
    }

    if (message != null) {
      body["message"] = message;
    }

    if (sharing != null) {
      body["sharing"] = sharing.toJson();
    }

    if (appVersion != null) {
      body["app_version"] = appVersion;
    }

    if (appDate != null) {
      body["app_date"] = appDate;
    }

    return await _manager._authenticatedPost<CheckInResponse>("checking",
        body: jsonEncode(body));
  }

  /// Removes any active checkins, no need to provide a specific item.
  ///
  /// 🔒 OAuth Required
  Future<void> delateActiveCheckins() async {
    return await _manager._authenticatedDelete("checkin");
  }
}
