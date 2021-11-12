part of 'trakt_manager.dart';

extension SeasonRequests on TraktManager {
  Future<List<Season>> getShowSeasons(String id, {bool extendedFull = false}) async {
    return await _getList("shows/$id/seasons", extendedFull: extendedFull);
  }

  Future<List<Episode>> getShowSeasonSummary(String id, int seasonNumber, {bool extendedFull = false}) async {
    return await _getList("shows/$id/seasons/$seasonNumber", extendedFull: extendedFull);
  }

  Future<List<Comment>> getShowSeasonComments(String id, int seasonNumber, {CommentsSortBy sortBy = CommentsSortBy.newest, RequestPagination? pagination}) async {
    return await _getList("shows/$id/seasons/$seasonNumber/comments/${sortBy.toString()}", pagination: pagination);
  }

  Future<List<TraktList>> getShowSeasonLists(String id, int seasonNumber, {ListType type = ListType.personal, ListSort sortBy = ListSort.popular, RequestPagination? pagination}) async {
    return await _getList("shows/$id/seasons/$seasonNumber/lists/${type.toString()}/${sortBy.toString()}", pagination: pagination);
  }

  Future<ShowPeople> getShowSeasonPeople(String id, int seasonNumber, {bool extendedFull = false}) async {
    return await _get("shows/$id/seasons/$seasonNumber/people", extendedFull: extendedFull);
  }

  Future<Rating> getShowSeasonRatings(String id, int seasonNumber) async {
    return await _get("shows/$id/seasons/$seasonNumber/ratings");
  }

  Future<ShowStats> getShowSeasonsStats(String id, int seasonNumber) async {
    return await _get<ShowStats>("shows/$id/seasons/$seasonNumber/stats");
  }

  Future<List<User>> getShowSeasonWatchers(String id, int seasonNumber, {bool extendedFull = false}) async {
    return await _getList<User>("shows/$id/seasons/$seasonNumber/watching", extendedFull: extendedFull);
  }
}