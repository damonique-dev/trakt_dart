part of trakt_dart;

extension NetworkRequests on TraktManager {
  /// Get a list of all TV networks, including the name.
  Future<List<Network>> getNetworks() async {
    return await _getList<Network>("networks");
  }
}
