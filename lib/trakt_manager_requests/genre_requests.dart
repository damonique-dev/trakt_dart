part of trakt_dart;

/// One or more genres are attached to all movies and shows.
/// Some API methods allow filtering by genre, so it's good to cache this list in your app.
class Genres extends Category {
  Genres(TraktManager manager) : super(manager);

  /// Get a list of all genres, including names and slugs.
  ///
  /// [type] - Possible values:  movies , shows
  Future<List<Genre>> getGenres(MoviesShowsType type) async {
    return await _manager._getList<Genre>("genres/${type.value}");
  }
}
