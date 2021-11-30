part of trakt_dart;

class Networks extends Category {
  Networks(TraktManager manager) : super(manager);

  /// Get a list of all TV networks, including the name.
  Future<List<Network>> getNetworks() async {
    return await _manager._getList<Network>("networks");
  }
}
