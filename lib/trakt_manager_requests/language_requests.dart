part of trakt_dart;

/// Some API methods allow filtering by language code, so it's good to cache this list in your app.
class Languages extends Category {
  Languages(TraktManager manager) : super(manager);

  /// Get a list of all langauges, including names and codes.
  ///
  /// [type] - Possible values:  movies , shows
  Future<List<Language>> getLanguages(LanguageType type) async {
    return await _manager._getList<Language>("languages/${type.value}");
  }
}
