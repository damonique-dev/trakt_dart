part of trakt_dart;

/// Most TV shows have a TV network where it originally aired.
/// Some API methods allow filtering by network, so it's good to cache this list in your app.
class Networks extends Category {
  Networks(TraktManager manager) : super(manager);

  /// Get a list of all TV networks, including the name.
  Future<List<Network>> getNetworks() async {
    return await _manager._getList<Network>("networks");
  }
}
