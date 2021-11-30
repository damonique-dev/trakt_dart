part of trakt_dart;

class Genres extends Category {
  Genres(TraktManager manager) : super(manager);

  /// Get a list of all genres, including names and slugs.
  ///
  /// [type] - Possible values:  movies , shows
  Future<List<Genre>> getGenres(GenreType type) async {
    return await _manager._getList<Genre>("genres/${type.value}");
  }
}
