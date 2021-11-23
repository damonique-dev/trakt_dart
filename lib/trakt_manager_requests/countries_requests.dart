part of trakt_dart;

extension CountriesRequests on TraktManager {
  /// Get a list of all countries, including names and codes.
  ///
  /// [type] - Possible values:  movies , shows
  Future<List<Country>> getCountries(CountryType type) async {
    return await _getList<Country>("countries/${type.value}");
  }
}
