part of trakt_dart;

extension GenreRequests on TraktManager {
  /// Get a list of all genres, including names and slugs.
  ///
  /// [type] - Possible values:  movies , shows
  Future<List<Genre>> getGenres(GenreType type) async {
    return await _getList<Genre>("genres/${type.value}");
  }
}
