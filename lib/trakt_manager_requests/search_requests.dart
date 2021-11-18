part of trakt_dart;

extension SearchRequests on TraktManager {
  Future<List<SearchResult>> searchTextQuery(
      String query, List<SearchType> searchTypes,
      {bool extendedFull = false,
      RequestPagination? pagination,
      Filters? filters,
      List<SearchField>? searchFields}) async {
    final type = searchTypes.map((type) => type.value).join(",");
    final params = {"query": query};
    if (searchFields?.isNotEmpty ?? false) {
      params["fields"] = searchFields!.map((type) => type.value).join(",");
    }
    return await _getList<SearchResult>("search/$type",
        extendedFull: extendedFull,
        pagination: pagination,
        filters: filters,
        queryParamameters: params);
  }

  Future<List<SearchResult>> searchIds(
    SearchIdType idType,
    String id, {
    List<SearchType>? searchTypes,
    bool extendedFull = false,
    RequestPagination? pagination,
  }) async {
    Map<String, String>? params;
    if (searchTypes?.isNotEmpty ?? false) {
      params = {"type": searchTypes!.map((type) => type.value).join(",")};
    }

    return await _getList<SearchResult>("search/${idType.value}/$id",
        extendedFull: extendedFull,
        pagination: pagination,
        queryParamameters: params);
  }
}
