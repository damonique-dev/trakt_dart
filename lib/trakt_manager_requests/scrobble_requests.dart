part of trakt_dart;

class Scrobble extends Category {
  Scrobble(TraktManager manager) : super(manager);

  /// Use this method when the video initially starts playing or is unpaused.
  /// This will remove any playback progress if it exists.
  ///
  /// Note: A watching status will auto expire after the remaining runtime has elapsed.
  /// There is no need to call this method again while continuing to watch the same item.
  ///
  /// 🔒 OAuth Required
  Future<ScrobbleResponse> startWatching({
    required double progress,
    Movie? movie,
    Episode? episode,
    String? appVersion,
    String? appDate,
  }) async {
    assert((movie != null || episode != null),
        "A movie or episode must be provided");
    assert((movie == null || episode == null),
        "Cannot check in a movie and episode in one request.");
    Map<String, dynamic> body = {"progess": "$progress"};

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

    if (appVersion != null) {
      body["app_version"] = appVersion;
    }

    if (appDate != null) {
      body["app_date"] = appDate;
    }

    return await _manager._authenticatedPost<ScrobbleResponse>("scrobble/start",
        body: jsonEncode(body));
  }

  /// Use this method when the video is paused.
  ///
  /// The playback progress will be saved and /sync/playback can be used to resume the video from this exact position.
  /// Unpause a video by calling the /scrobble/start method again.
  ///
  /// 🔒 OAuth Required
  Future<ScrobbleResponse> pauseWatching({
    required double progress,
    Movie? movie,
    Episode? episode,
    String? appVersion,
    String? appDate,
  }) async {
    assert((movie != null || episode != null),
        "A movie or episode must be provided");
    assert((movie == null || episode == null),
        "Cannot check in a movie and episode in one request.");
    Map<String, dynamic> body = {"progess": "$progress"};

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

    if (appVersion != null) {
      body["app_version"] = appVersion;
    }

    if (appDate != null) {
      body["app_date"] = appDate;
    }

    return await _manager._authenticatedPost<ScrobbleResponse>("scrobble/pause",
        body: jsonEncode(body));
  }

  /// Use this method when the video is stopped or finishes playing on its own.
  ///
  /// If the progress is above 80%, the video will be scrobbled and the action will be set to scrobble.
  /// A unique history id (64-bit integer) will be returned and can be used to reference this scrobble directly.
  ///
  /// If the progress is less than 80%, it will be treated as a pause and the action will be set to pause.
  /// The playback progress will be saved and /sync/playback can be used to resume the video from this exact position.
  ///
  /// Note: If you prefer to use a threshold higher than 80%, you should use /scrobble/pause yourself so it doesn't create duplicate scrobbles.
  ///
  /// 🔒 OAuth Required
  Future<ScrobbleResponse> stopWatching({
    required double progress,
    Movie? movie,
    Episode? episode,
    String? appVersion,
    String? appDate,
  }) async {
    assert((movie != null || episode != null),
        "A movie or episode must be provided");
    assert((movie == null || episode == null),
        "Cannot check in a movie and episode in one request.");
    Map<String, dynamic> body = {"progess": "$progress"};

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

    if (appVersion != null) {
      body["app_version"] = appVersion;
    }

    if (appDate != null) {
      body["app_date"] = appDate;
    }

    return await _manager._authenticatedPost<ScrobbleResponse>("scrobble/stop",
        body: jsonEncode(body));
  }
}
