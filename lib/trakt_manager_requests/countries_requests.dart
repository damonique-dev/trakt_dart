part of trakt_dart;

extension CountriesRequests on TraktManager {
  Future<List<Country>> getCountries(CountryType type) async {
    return await _getList<Country>("countries/${type.value}");
  }
}
