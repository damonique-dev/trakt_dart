part of trakt_dart;

class Seasons extends Category {
  Seasons(TraktManager manager) : super(manager);

  /// Returns all seasons for a show including the number of episodes in each season.
  ///
  /// Episodes:
  /// If you add [extendedEpisodes] to the URL, it will return all episodes for all seasons.
  /// Note: This returns a lot of data, so please only use this extended parameter if you actually need it!
  ///
  /// [id] - Trakt ID, Trakt slug, or IMDB ID
  ///
  /// ✨ Extended Info
  Future<List<Season>> getShowSeasons(String id,
      {bool extendedFull = false, bool extendedEpisodes = false}) async {
    Map<String, String>? params;
    List<String> extendedParams = [];
    if (extendedFull) {
      extendedParams.add("full");
    }
    if (extendedEpisodes) {
      extendedParams.add("episodes");
    }
    if (extendedParams.isNotEmpty) {
      params = {};
      params["extended"] = extendedParams.join(",");
    }
    return await _manager._getList("shows/$id/seasons",
        queryParamameters: params);
  }

  /// Returns all episodes for a specific season of a show.
  ///
  /// Translations:
  /// If you'd like to included translated episode titles and overviews in the response, include the translations parameter in the URL.
  /// Include all languages by setting the parameter to all or use a specific 2 digit country language code to further limit it.
  /// Note: This returns a lot of data, so please only use this parameter if you actually need it!
  ///
  /// [id] - Trakt ID, Trakt slug, or IMDB ID.
  /// [seasonNumber] - season number
  ///
  /// ✨ Extended Info
  Future<List<Episode>> getShowSeasonSummary(String id, int seasonNumber,
      {String? translations, bool extendedFull = false}) async {
    Map<String, String>? params =
        translations == null ? null : {"translations": translations};
    return await _manager._getList("shows/$id/seasons/$seasonNumber",
        extendedFull: extendedFull, queryParamameters: params);
  }

  /// Returns all top level comments for a season.
  ///
  /// By default, the newest comments are returned first.
  /// Other sorting options include oldest, most likes, most replies, highest rated, lowest rated, most plays, and highest watched percentage.
  ///
  /// [id] - Trakt ID, Trakt slug, or IMDB ID.
  /// [seasonNumber] - season number
  /// [sortBy] - how to sort
  ///
  /// 📄 Pagination 😁 Emojis
  Future<List<Comment>> getShowSeasonComments(String id, int seasonNumber,
      {CommentsSortBy sortBy = CommentsSortBy.newest,
      RequestPagination? pagination}) async {
    return await _manager._getList(
        "shows/$id/seasons/$seasonNumber/comments/${sortBy.value}",
        pagination: pagination);
  }

  /// Returns all lists that contain this season.
  ///
  /// By default, personal lists are returned sorted by the most popular.
  ///
  /// [id] - Trakt ID, Trakt slug, or IMDB ID.
  /// [seasonNumber] - season number
  /// [type] - Filter for a specific list type
  /// [sortBy] - how to sort
  ///
  /// 📄 Pagination 😁 Emojis
  Future<List<TraktList>> getShowSeasonLists(String id, int seasonNumber,
      {ListType type = ListType.personal,
      ListSort sortBy = ListSort.popular,
      RequestPagination? pagination}) async {
    return await _manager._getList(
        "shows/$id/seasons/$seasonNumber/lists/${type.value}/${sortBy.value}",
        pagination: pagination);
  }

  /// Returns all cast and crew for a season, including the episode_count for which they appear.
  ///
  /// Each cast member will have a characters array and a standard person object.
  /// The crew object will be broken up into production, art, crew, costume & make-up, directing, writing, sound, camera,
  /// visual effects, lighting, and editing (if there are people for those crew positions)..
  /// Each of those members will have a jobs array and a standard person object.
  ///
  /// Guest Stars:
  /// If you add [includeGuestStars], it will return all guest stars that appeared in at least 1 episode of the season.
  /// Note: This returns a lot of data, so please only use this extended parameter if you actually need it!
  ///
  /// [id] - Trakt ID, Trakt slug, or IMDB ID.
  /// [seasonNumber] - season number
  ///
  /// ✨ Extended Info
  Future<ShowPeople> getShowSeasonPeople(String id, int seasonNumber,
      {bool extendedFull = false, bool includeGuestStars = false}) async {
    return await _manager._get("shows/$id/seasons/$seasonNumber/people",
        extendedFull: extendedFull, includeGuestStars: includeGuestStars);
  }

  /// Returns rating (between 0 and 10) and distribution for a season.
  ///
  /// [id] - Trakt ID, Trakt slug, or IMDB ID.
  /// [seasonNumber] - season number
  Future<Rating> getShowSeasonRatings(String id, int seasonNumber) async {
    return await _manager._get("shows/$id/seasons/$seasonNumber/ratings");
  }

  /// Returns lots of season stats.
  ///
  /// [id] - Trakt ID, Trakt slug, or IMDB ID.
  /// [seasonNumber] - season number
  Future<SeasonStats> getShowSeasonsStats(String id, int seasonNumber) async {
    return await _manager
        ._get<SeasonStats>("shows/$id/seasons/$seasonNumber/stats");
  }

  /// Returns all users watching this season right now.
  ///
  /// [id] - Trakt ID, Trakt slug, or IMDB ID.
  /// [seasonNumber] - season number
  ///
  /// ✨ Extended Info
  Future<List<User>> getShowSeasonWatchers(String id, int seasonNumber,
      {bool extendedFull = false}) async {
    return await _manager._getList<User>(
        "shows/$id/seasons/$seasonNumber/watching",
        extendedFull: extendedFull);
  }
}
