part of trakt_dart;

extension GenreRequests on TraktManager {
  Future<List<Genre>> getGenres(GenreType type) async {
    return await _getList<Genre>("genres/${type.value}");
  }
}
