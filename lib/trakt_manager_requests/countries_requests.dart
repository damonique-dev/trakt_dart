part of trakt_dart;

class Countries extends Category {
  Countries(TraktManager manager) : super(manager);

  /// Get a list of all countries, including names and codes.
  ///
  /// [type] - Possible values:  movies , shows
  Future<List<Country>> getCountries(CountryType type) async {
    return await _manager._getList<Country>("countries/${type.value}");
  }
}
