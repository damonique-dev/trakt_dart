part of trakt_dart;

extension LanguageRequests on TraktManager {
  /// Get a list of all langauges, including names and codes.
  ///
  /// [type] - Possible values:  movies , shows
  Future<List<Language>> getLanguages(LanguageType type) async {
    return await _getList<Language>("languages/${type.value}");
  }
}
