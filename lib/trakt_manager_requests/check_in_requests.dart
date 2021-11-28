part of trakt_dart;

extension CheckInRequests on TraktManager {
  /// Check into a movie or episode.
  ///
  /// This should be tied to a user action to manually indicate they are watching something.
  /// The item will display as watching on the site, then automatically switch to watched status once the duration has elapsed.
  /// A unique history id (64-bit integer) will be returned and can be used to reference this checkin directly.
  ///
  /// [movie] - The movie to checkin
  /// [episode] - The episode to checkin
  ///
  /// 🔒 OAuth Required
  Future<CheckInResponse> checkIn({
    required String appVersion,
    required String appDate,
    Movie? movie,
    Episode? episode,
    String? message,
    CheckInSharing? sharing,
  }) async {
    // assert((movie == null || episode == null),
    //     "Cannot check in both a movie and episode in one request.");
    assert((movie != null || episode != null),
        "Cannot check in both a movie and episode in one request.");
    final Map<String, dynamic> body = {
      "app_version": appVersion,
      "app_date": appDate
    };

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

    return await _authenticatedPost<CheckInResponse>("checking",
        body: jsonEncode(body));
  }

  /// Removes any active checkins, no need to provide a specific item.
  ///
  /// 🔒 OAuth Required
  Future<void> delateActiveCheckins() async {
    return await _authenticatedDelete("checkin");
  }
}
