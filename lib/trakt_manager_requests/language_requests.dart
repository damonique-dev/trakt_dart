part of trakt_dart;

class Languages extends Category {
  Languages(TraktManager manager) : super(manager);

  /// Get a list of all langauges, including names and codes.
  ///
  /// [type] - Possible values:  movies , shows
  Future<List<Language>> getLanguages(LanguageType type) async {
    return await _manager._getList<Language>("languages/${type.value}");
  }
}
