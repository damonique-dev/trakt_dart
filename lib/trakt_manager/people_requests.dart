part of 'trakt_manager.dart';

extension PeopleRequests on TraktManager {
  Future<Person> getPersonSummary(String id, {bool extendedFull = false}) async {
    return await _get("people/$id", extendedFull: extendedFull);
  }

  Future<PersonMovieCredits> getPersonMovieCredits(String id, {bool extendedFull = false}) async {
    return await _get("people/$id/movies", extendedFull: extendedFull);
  }

  Future<PersonShowCredits> getPersonShowCredits(String id, {bool extendedFull = false}) async {
    return await _get("people/$id/shows", extendedFull: extendedFull);
  }

  Future<List<TraktList>> getEpisodeLists(String id, {ListType type = ListType.personal, ListSort sortBy = ListSort.popular, RequestPagination? pagination}) async {
    return await _getList<TraktList>("people/$id/lists/${type.toString()}/${sortBy.toString()}", pagination: pagination);
  }
}