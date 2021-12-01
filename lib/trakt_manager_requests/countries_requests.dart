part of trakt_dart;

/// Some API methods allow filtering by country code, so it's good to cache this list in your app.
class Countries extends Category {
  Countries(TraktManager manager) : super(manager);

  /// Get a list of all countries, including names and codes.
  ///
  /// [type] - Possible values:  movies , shows
  Future<List<Country>> getCountries(CountryType type) async {
    return await _manager._getList<Country>("countries/${type.value}");
  }
}
