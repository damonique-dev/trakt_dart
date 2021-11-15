part of 'trakt_manager.dart';

extension ShowRequests on TraktManager {
  Future<List<TrendingShow>> getTrendingShows(
      {bool extendedFull = false,
      RequestPagination? pagination,
      ShowFilters? filters}) async {
    return await _getList("shows/trending",
        extendedFull: extendedFull, pagination: pagination, filters: filters);
  }

  Future<List<Show>> getPopularShows(TimePeriod period,
      {bool extendedFull = false,
      RequestPagination? pagination,
      ShowFilters? filters}) async {
    return await _getList("shows/popular",
        extendedFull: extendedFull, pagination: pagination, filters: filters);
  }

  Future<List<RecommendedShow>> getRecommendedShows(TimePeriod period,
      {bool extendedFull = false,
      RequestPagination? pagination,
      ShowFilters? filters}) async {
    return await _getList("shows/recommended/${period.value}",
        extendedFull: extendedFull, pagination: pagination, filters: filters);
  }

  Future<List<PlayedWatchedCollectedShow>> getMostPlayedShows(TimePeriod period,
      {bool extendedFull = false,
      RequestPagination? pagination,
      ShowFilters? filters}) async {
    return await _getList("shows/played/${period.value}",
        extendedFull: extendedFull, pagination: pagination, filters: filters);
  }

  Future<List<PlayedWatchedCollectedShow>> getMostWatchedShows(
      TimePeriod period,
      {bool extendedFull = false,
      RequestPagination? pagination,
      ShowFilters? filters}) async {
    return await _getList("shows/watched/${period.value}",
        extendedFull: extendedFull, pagination: pagination, filters: filters);
  }

  Future<List<PlayedWatchedCollectedShow>> getMostCollectedShows(
      TimePeriod period,
      {bool extendedFull = false,
      RequestPagination? pagination,
      ShowFilters? filters}) async {
    return await _getList("shows/collected/${period.value}",
        extendedFull: extendedFull, pagination: pagination, filters: filters);
  }

  Future<List<AnticipatedShow>> getMostAnticipatedShows(
      {bool extendedFull = false,
      RequestPagination? pagination,
      ShowFilters? filters}) async {
    return await _getList("shows/anticipated",
        extendedFull: extendedFull, pagination: pagination, filters: filters);
  }

  Future<List<UpdatedShow>> getUpdatedShows(String startDate,
      {bool extendedFull = false, RequestPagination? pagination}) async {
    return await _getList("shows/updates/startDate",
        extendedFull: extendedFull, pagination: pagination);
  }

  Future<List<int>> getUpdatedShowIds(String startDate,
      {RequestPagination? pagination}) async {
    return await _getIds("shows/updates/id/startDate", pagination: pagination);
  }

  Future<Show> getShowSummary(String id, {bool extendedFull = false}) async {
    return await _get<Show>("shows/$id", extendedFull: extendedFull);
  }

  Future<List<MovieShowAlias>> getShowAliases(String id) async {
    return await _getList<MovieShowAlias>("shows/$id/aliases");
  }

  // TODO: returning 500 no matter the show id...?
  // Future<List<ShowCertification>> getShowCertifications(String id) async {
  //   return await _getList<ShowCertification>("shows/$id/certification");
  // }

  Future<List<ShowTranslation>> getShowTranslations(String id,
      {String language = ""}) async {
    return await _getList<ShowTranslation>("shows/$id/translations/$language");
  }

  Future<List<Comment>> getShowComments(String id,
      {CommentsSortBy sortBy = CommentsSortBy.newest,
      RequestPagination? pagination}) async {
    return await _getList<Comment>("shows/$id/comments/${sortBy.value}",
        pagination: pagination);
  }

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

  Future<ShowPeople> getShowPeople(String id,
      {bool extendedFull = false}) async {
    return await _get<ShowPeople>("shows/$id/people",
        extendedFull: extendedFull);
  }

  Future<Rating> getShowRatings(String id) async {
    return await _get<Rating>("shows/$id/ratings");
  }

  Future<List<Show>> getRelatedShow(String id,
      {bool extendedFull = false, RequestPagination? pagination}) async {
    return await _getList<Show>("shows/$id/related",
        extendedFull: extendedFull, pagination: pagination);
  }

  Future<ShowStats> getShowStats(String id) async {
    return await _get<ShowStats>("shows/$id/stats");
  }

  Future<List<User>> getShowWatchers(String id,
      {bool extendedFull = false}) async {
    return await _getList<User>("shows/$id/watching",
        extendedFull: extendedFull);
  }

  Future<Episode> getShowNextEpisode(String id,
      {bool extendedFull = false}) async {
    return await _get<Episode>("shows/$id/next_episode",
        extendedFull: extendedFull);
  }

  Future<Episode> getShowLastEpisode(String id,
      {bool extendedFull = false}) async {
    return await _get<Episode>("shows/$id/last_episode",
        extendedFull: extendedFull);
  }
}
