part of trakt_dart;

class Episodes extends Category {
  Episodes(TraktManager manager) : super(manager);

  /// Returns a single episode's details.
  ///
  /// All date and times are in UTC and were calculated using the episode's air_date and show's country and air_time.
  ///
  /// Note: If the first_aired is unknown, it will be set to null.
  ///
  /// [id] - Trakt ID, Trakt slug, or IMDB ID
  /// [seasonNumber] - season number
  /// [episodeNumber] - episode number
  ///
  /// ✨ Extended Info
  Future<Episode> getEpisodeSummary(
      String id, int seasonNumber, int episodeNumber,
      {bool extendedFull = false}) async {
    return await _manager._get(
        "shows/$id/seasons/$seasonNumber/episodes/$episodeNumber",
        extendedFull: extendedFull);
  }

  /// Returns all translations for an episode, including language and translated values for title and overview.
  ///
  /// [id] - Trakt ID, Trakt slug, or IMDB ID
  /// [seasonNumber] - season number
  /// [episodeNumber] - episode number
  /// [language] - 2 character language code
  Future<List<ShowTranslation>> getEpisodeTranslations(
      String id, int seasonNumber, int episodeNumber,
      {String language = ""}) async {
    return await _manager._getList<ShowTranslation>(
        "shows/$id/seasons/$seasonNumber/episodes/$episodeNumber/translations/$language");
  }

  /// Returns all top level comments for an episode.
  ///
  /// By default, the newest comments are returned first.
  /// Other sorting options include oldest, most likes, most replies, highest rated, lowest rated, and most plays.
  ///
  /// [id] - Trakt ID, Trakt slug, or IMDB ID
  /// [seasonNumber] - season number
  /// [episodeNumber] - episode number
  /// [sortBy] - how to sort
  ///
  /// 📄 Pagination 😁 Emojis
  Future<List<Comment>> getEpisodeComments(
      String id, int seasonNumber, int episodeNumber,
      {CommentsSortBy sortBy = CommentsSortBy.newest,
      RequestPagination? pagination}) async {
    return await _manager._getList<Comment>(
        "shows/$id/seasons/$seasonNumber/episodes/$episodeNumber/comments/${sortBy.value}",
        pagination: pagination);
  }

  /// Returns all lists that contain this episode.
  ///
  /// By default, personal lists are returned sorted by the most popular.
  ///
  /// [id] - Trakt ID, Trakt slug, or IMDB ID
  /// [seasonNumber] - season number
  /// [episodeNumber] - episode number
  /// [type] - Filter for a specific list type
  /// [sortBy] - how to sort
  ///
  /// 📄 Pagination 😁 Emojis
  Future<List<TraktList>> getEpisodeLists(
      String id, int seasonNumber, int episodeNumber,
      {ListType type = ListType.personal,
      ListSort sortBy = ListSort.popular,
      RequestPagination? pagination}) async {
    return await _manager._getList<TraktList>(
        "shows/$id/seasons/$seasonNumber/episodes/$episodeNumber/lists/${type.value}/${sortBy.value}",
        pagination: pagination);
  }

  /// Returns all lists that contain this episode.
  ///
  /// By default, personal lists are returned sorted by the most popular.
  ///
  /// If you add [includeGuestStars], it will return all guest stars that appeared in the episode.
  /// Note: This returns a lot of data, so please only use this extended parameter if you actually need it!
  ///
  /// [id] - Trakt ID, Trakt slug, or IMDB ID
  /// [seasonNumber] - season number
  /// [episodeNumber] - episode number
  /// [includeGuestStars] - whether to return all guest stars that appeared in the episode.
  ///
  /// ✨ Extended Info
  Future<EpisodePeople> getEpisodePeople(
      String id, int seasonNumber, int episodeNumber,
      {bool extendedFull = false, bool includeGuestStars = false}) async {
    return await _manager._get<EpisodePeople>(
        "shows/$id/seasons/$seasonNumber/episodes/$episodeNumber/people",
        extendedFull: extendedFull,
        includeGuestStars: includeGuestStars);
  }

  /// Returns rating (between 0 and 10) and distribution for an episode.
  ///
  /// [id] - Trakt ID, Trakt slug, or IMDB ID
  /// [seasonNumber] - season number
  /// [episodeNumber] - episode number
  Future<Rating> getEpisodeRatings(
      String id, int seasonNumber, int episodeNumber) async {
    return await _manager._get(
        "shows/$id/seasons/$seasonNumber/episodes/$episodeNumber/ratings");
  }

  /// Returns lots of episode stats.
  ///
  /// [id] - Trakt ID, Trakt slug, or IMDB ID
  /// [seasonNumber] - season number
  /// [episodeNumber] - episode number
  Future<EpisodeStats> getEpisodeStats(
      String id, int seasonNumber, int episodeNumber) async {
    return await _manager._get<EpisodeStats>(
        "shows/$id/seasons/$seasonNumber/episodes/$episodeNumber/stats");
  }

  /// Returns all users watching this episode right now.
  ///
  /// [id] - Trakt ID, Trakt slug, or IMDB ID
  /// [seasonNumber] - season number
  /// [episodeNumber] - episode number
  ///
  /// ✨ Extended Info
  Future<List<User>> getEpisodeWatchers(
      String id, int seasonNumber, int episodeNumber,
      {bool extendedFull = false}) async {
    return await _manager._getList<User>(
        "shows/$id/seasons/$seasonNumber/episodes/$episodeNumber/watching",
        extendedFull: extendedFull);
  }
}
