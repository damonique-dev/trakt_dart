part of trakt_dart;

class Search extends Category {
  Search(TraktManager manager) : super(manager);

  /// Search all text fields that a media object contains (i.e. title, overview, etc).
  ///
  /// Results are ordered by the most relevant score. Specify the type of results by sending a
  /// single value or a comma delimited string for multiple types.
  ///
  /// Special Characters:
  /// Our search engine (Solr) gives the following characters special meaning when they appear in a query:
  ///
  ///     + - && || ! ( ) { } [ ] ^ " ~ * ? : /
  ///
  /// To interpret any of these characters literally (and not as a special character), precede the character with
  /// a backslash \ character.
  ///
  /// [query] - Search all text based fields.
  /// [searchTypes] - Search type. Possible values:  movie , show , episode , person , list
  ///
  /// Search Fields:
  /// By default, all text fields are used to search for the query. You can optionally specify the fields
  /// parameter with a single value or comma delimited string for multiple fields. Each type has specific
  /// fields that can be specified. This can be useful if you want to support more strict searches (i.e. title only).
  ///
  /// 📄 Pagination ✨ Extended Info 🎚 Filters
  Future<List<SearchResult>> searchTextQuery(
      String query, List<SearchType> searchTypes,
      {bool extendedFull = false,
      RequestPagination? pagination,
      Filters? filters,
      List<SearchField>? searchFields}) async {
    final type = searchTypes.map((type) => type.value).join(",");
    Map<String, dynamic> params = {"query": query};
    if (searchFields?.isNotEmpty ?? false) {
      params["fields"] = searchFields!.map((type) => type.value).join(",");
    }
    return await _manager._getList<SearchResult>("search/$type",
        extendedFull: extendedFull,
        pagination: pagination,
        filters: filters,
        queryParamameters: params);
  }

  /// Lookup items by their Trakt, IMDB, TMDB, or TVDB ID.
  ///
  /// If you use the search url without a type it might return multiple items if the id_type
  /// is not globally unique. Specify the type of results by sending a single value or a comma
  /// delimited string for multiple types.
  ///
  /// [idType] - Type of ID to lookup.
  /// [id] - ID that matches with the type
  /// [searchTypes] - Search type. Possible values: movie, show, episode, person, list
  ///
  /// 📄 Pagination ✨ Extended Info
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

    return await _manager._getList<SearchResult>("search/${idType.value}/$id",
        extendedFull: extendedFull,
        pagination: pagination,
        queryParamameters: params);
  }
}
