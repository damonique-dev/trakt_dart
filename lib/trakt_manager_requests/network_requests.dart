part of trakt_dart;

extension NetworkRequests on TraktManager {
  Future<List<Network>> getNetworks() async {
    return await _getList<Network>("networks");
  }
}
