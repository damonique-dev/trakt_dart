part of trakt_dart;

extension ShowRequests on TraktManager {
  /// Returns all shows being watched right now.
  ///
  /// Shows with the most users are returned first.
  ///
  /// 📄 Pagination ✨ Extended Info 🎚 Filters
  Future<List<TrendingShow>> getTrendingShows(
      {bool extendedFull = false,
      RequestPagination? pagination,
      ShowFilters? filters}) async {
    return await _getList("shows/trending",
        extendedFull: extendedFull, pagination: pagination, filters: filters);
  }

  /// Returns the most popular shows.
  ///
  /// Popularity is calculated using the rating percentage and the number of ratings.
  ///
  /// 📄 Pagination ✨ Extended Info 🎚 Filters
  Future<List<Show>> getPopularShows(
      {bool extendedFull = false,
      RequestPagination? pagination,
      ShowFilters? filters}) async {
    return await _getList("shows/popular",
        extendedFull: extendedFull, pagination: pagination, filters: filters);
  }

  /// Returns the most recommended shows in the specified time period, defaulting to weekly.
  ///
  /// All stats are relative to the specific time period.
  ///
  /// [period] - time period. Possible values:  daily , weekly , monthly , yearly , all
  ///
  /// 📄 Pagination ✨ Extended Info 🎚 Filters
  Future<List<RecommendedShow>> getRecommendedShows(TimePeriod period,
      {bool extendedFull = false,
      RequestPagination? pagination,
      ShowFilters? filters}) async {
    return await _getList("shows/recommended/${period.value}",
        extendedFull: extendedFull, pagination: pagination, filters: filters);
  }

  /// Returns the most played (a single user can watch multiple episodes multiple times) shows in the specified time period,
  /// defaulting to weekly.
  ///
  /// All stats are relative to the specific time period.
  ///
  /// [period] - time period. Possible values:  daily , weekly , monthly , yearly , all
  ///
  /// 📄 Pagination ✨ Extended Info 🎚 Filters
  Future<List<PlayedWatchedCollectedShow>> getMostPlayedShows(TimePeriod period,
      {bool extendedFull = false,
      RequestPagination? pagination,
      ShowFilters? filters}) async {
    return await _getList("shows/played/${period.value}",
        extendedFull: extendedFull, pagination: pagination, filters: filters);
  }

  /// Returns the most watched (unique users) shows in the specified time period, defaulting to weekly.
  ///
  /// All stats are relative to the specific time period.
  ///
  /// [period] - time period. Possible values:  daily , weekly , monthly , yearly , all
  ///
  /// 📄 Pagination ✨ Extended Info 🎚 Filters
  Future<List<PlayedWatchedCollectedShow>> getMostWatchedShows(
      TimePeriod period,
      {bool extendedFull = false,
      RequestPagination? pagination,
      ShowFilters? filters}) async {
    return await _getList("shows/watched/${period.value}",
        extendedFull: extendedFull, pagination: pagination, filters: filters);
  }

  /// Returns the most collected (unique users) shows in the specified time period, defaulting to weekly.
  ///
  /// All stats are relative to the specific time period.
  ///
  /// [period] - time period. Possible values:  daily , weekly , monthly , yearly , all
  ///
  /// 📄 Pagination ✨ Extended Info 🎚 Filters
  Future<List<PlayedWatchedCollectedShow>> getMostCollectedShows(
      TimePeriod period,
      {bool extendedFull = false,
      RequestPagination? pagination,
      ShowFilters? filters}) async {
    return await _getList("shows/collected/${period.value}",
        extendedFull: extendedFull, pagination: pagination, filters: filters);
  }

  /// Returns the most anticipated shows based on the number of lists a show appears on.
  ///
  /// 📄 Pagination ✨ Extended Info 🎚 Filters
  Future<List<AnticipatedShow>> getMostAnticipatedShows(
      {bool extendedFull = false,
      RequestPagination? pagination,
      ShowFilters? filters}) async {
    return await _getList("shows/anticipated",
        extendedFull: extendedFull, pagination: pagination, filters: filters);
  }

  /// Returns all shows updated since the specified UTC date and time.
  ///
  /// We recommended storing the X-Start-Date header you can be efficient using this method moving forward.
  /// By default, 10 results are returned. You can send a limit to get up to 100 results per page.
  ///
  /// Important! The start_date is only accurate to the hour, for caching purposes.
  /// Please drop the minutes and seconds from your timestamp to help optimize our cached data.
  /// For example, use 2021-07-17T12:00:00Z and not 2021-07-17T12:23:34Z.
  ///
  /// Note: The start_date can only be a maximum of 30 days in the past.
  ///
  /// [startDate] - Updated since this date and time.
  ///
  /// 📄 Pagination ✨ Extended Info
  Future<List<UpdatedShow>> getUpdatedShows(String startDate,
      {bool extendedFull = false, RequestPagination? pagination}) async {
    return await _getList("shows/updates/startDate",
        extendedFull: extendedFull, pagination: pagination);
  }

  /// Returns all show Trakt IDs updated since the specified UTC date and time.
  ///
  /// We recommended storing the X-Start-Date header you can be efficient using this method moving forward.
  /// By default, 10 results are returned. You can send a limit to get up to 100 results per page.
  ///
  /// Important! The start_date is only accurate to the hour, for caching purposes.
  /// Please drop the minutes and seconds from your timestamp to help optimize our cached data.
  /// For example, use 2021-07-17T12:00:00Z and not 2021-07-17T12:23:34Z.
  ///
  /// Note: The start_date can only be a maximum of 30 days in the past.
  ///
  /// [startDate] - Updated since this date and time.
  ///
  /// 📄 Pagination ✨ Extended Info
  Future<List<int>> getUpdatedShowIds(String startDate,
      {RequestPagination? pagination}) async {
    return await _getIds("shows/updates/id/startDate", pagination: pagination);
  }

  /// Returns a single shows's details.
  ///
  /// If you request extended info, the airs object is relative to the show's country.
  /// You can use the day, time, and timezone to construct your own date then convert it to whatever timezone your user is in.
  ///
  /// Note: When getting full extended info, the status field can have a value of returning series (airing right now),
  /// in production (airing soon), planned (in development), canceled, or ended.
  ///
  /// [id] - Trakt ID, Trakt slug, or IMDB ID
  ///
  /// ✨ Extended Info
  Future<Show> getShowSummary(String id, {bool extendedFull = false}) async {
    return await _get<Show>("shows/$id", extendedFull: extendedFull);
  }

  /// Returns all title aliases for a show. Includes country where name is different.
  ///
  /// [id] - Trakt ID, Trakt slug, or IMDB ID
  Future<List<MovieShowAlias>> getShowAliases(String id) async {
    return await _getList<MovieShowAlias>("shows/$id/aliases");
  }

  // TODO: returning 500 no matter the show id...?
  // Future<List<ShowCertification>> getShowCertifications(String id) async {
  //   return await _getList<ShowCertification>("shows/$id/certification");
  // }

  /// Returns all translations for a show, including language and translated values for title and overview.
  ///
  /// [id] - Trakt ID, Trakt slug, or IMDB ID
  /// [language] - 2 character language code
  Future<List<ShowTranslation>> getShowTranslations(String id,
      {String language = ""}) async {
    return await _getList<ShowTranslation>("shows/$id/translations/$language");
  }

  /// Returns all top level comments for a show.
  ///
  /// By default, the newest comments are returned first.
  /// Other sorting options include oldest, most likes, most replies, highest rated, lowest rated, most plays, and highest watched percentage.
  ///
  /// [id] - Trakt ID, Trakt slug, or IMDB ID
  /// [sortBy] - how to sort.
  ///
  /// 📄 Pagination 😁 Emojis
  Future<List<Comment>> getShowComments(String id,
      {CommentsSortBy sortBy = CommentsSortBy.newest,
      RequestPagination? pagination}) async {
    return await _getList<Comment>("shows/$id/comments/${sortBy.value}",
        pagination: pagination);
  }

  /// Returns all lists that contain this show.
  ///
  /// By default, personal lists are returned sorted by the most popular.
  ///
  /// [id] - Trakt ID, Trakt slug, or IMDB ID
  /// [type] - Filter for a specific list type
  /// [sortBy] - how to sort.
  ///
  /// 📄 Pagination 😁 Emojis
  Future<List<TraktList>> getShowLists(String id,
      {ListType type = ListType.personal,
      ListSort sortBy = ListSort.popular,
      RequestPagination? pagination}) async {
    return await _getList<TraktList>(
        "shows/$id/lists/${type.value}/${sortBy.value}",
        pagination: pagination);
  }

  //TODO: Add Collection Progress Requests with OAuth is implemented.

  //TODO: Add Watched Progress Requests with OAuth is implemented.

  //TODO: Add Reset Watched Progress Requests with OAuth is implemented.

  /// Returns all cast and crew for a show, including the episode_count for which they appears.
  ///
  /// Each cast member will have a characters array and a standard person object.
  /// The crew object will be broken up into production, art, crew, costume & make-up, directing, writing,
  /// sound, camera, visual effects, lighting, editing, and created by (if there are people for those crew positions).
  /// Each of those members will have a jobs array and a standard person object.
  ///
  /// Guest Stars:
  /// If you add [includeGuestStars], it will return all guest stars that appeared in at least 1 episode of the show.
  /// Note: This returns a lot of data, so please only use this extended parameter if you actually need it!
  ///
  /// [id] - Trakt ID, Trakt slug, or IMDB ID
  ///
  /// ✨ Extended Info
  Future<ShowPeople> getShowPeople(String id,
      {bool extendedFull = false, bool includeGuestStars = false}) async {
    return await _get<ShowPeople>("shows/$id/people",
        extendedFull: extendedFull, includeGuestStars: includeGuestStars);
  }

  /// Returns rating (between 0 and 10) and distribution for a show.
  ///
  /// [id] - Trakt ID, Trakt slug, or IMDB ID
  Future<Rating> getShowRatings(String id) async {
    return await _get<Rating>("shows/$id/ratings");
  }

  /// Returns related and similar shows.
  ///
  /// [id] - Trakt ID, Trakt slug, or IMDB ID
  ///
  /// 📄 Pagination ✨ Extended Info
  Future<List<Show>> getRelatedShow(String id,
      {bool extendedFull = false, RequestPagination? pagination}) async {
    return await _getList<Show>("shows/$id/related",
        extendedFull: extendedFull, pagination: pagination);
  }

  /// Returns lots of show stats.
  ///
  /// [id] - Trakt ID, Trakt slug, or IMDB ID
  Future<ShowStats> getShowStats(String id) async {
    return await _get<ShowStats>("shows/$id/stats");
  }

  /// Returns all users watching this show right now.
  ///
  /// [id] - Trakt ID, Trakt slug, or IMDB ID
  ///
  /// ✨ Extended Info
  Future<List<User>> getShowWatchers(String id,
      {bool extendedFull = false}) async {
    return await _getList<User>("shows/$id/watching",
        extendedFull: extendedFull);
  }

  /// Returns the next scheduled to air episode.
  ///
  /// If no episode is found, a 204 HTTP status code will be returned.
  ///
  /// [id] - Trakt ID, Trakt slug, or IMDB ID
  ///
  /// ✨ Extended Info
  Future<Episode> getShowNextEpisode(String id,
      {bool extendedFull = false}) async {
    return await _get<Episode>("shows/$id/next_episode",
        extendedFull: extendedFull);
  }

  /// Returns the most recently aired episode.
  ///
  /// If no episode is found, a 204 HTTP status code will be returned.
  ///
  /// [id] - Trakt ID, Trakt slug, or IMDB ID
  ///
  /// ✨ Extended Info
  Future<Episode> getShowLastEpisode(String id,
      {bool extendedFull = false}) async {
    return await _get<Episode>("shows/$id/last_episode",
        extendedFull: extendedFull);
  }
}
