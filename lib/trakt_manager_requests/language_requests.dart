part of trakt_dart;

extension LanguageRequests on TraktManager {
  Future<List<Language>> getLanguages(LanguageType type) async {
    return await _getList<Language>("languages/${type.value}");
  }
}
