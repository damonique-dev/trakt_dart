part of trakt_dart;

extension ListRequests on TraktManager {
  Future<List<TrendingPopularList>> getTrendingLists(
      {RequestPagination? pagination}) async {
    return await _getList<TrendingPopularList>("lists/trending",
        pagination: pagination);
  }

  Future<List<TrendingPopularList>> getPopularLists(
      {RequestPagination? pagination}) async {
    return await _getList<TrendingPopularList>("lists/popular",
        pagination: pagination);
  }

  Future<TraktList> getList(String id) async {
    return await _get<TraktList>("lists/$id");
  }

  Future<List<ListLikes>> getListLikes(String id,
      {RequestPagination? pagination}) async {
    return await _getList<ListLikes>("lists/$id/likes", pagination: pagination);
  }

  Future<List<ListItem>> getListItems(
    String id, {
    ListType? listType,
    RequestPagination? pagination,
    bool extendedFull = false,
  }) async {
    var request = "lists/$id/items";
    if (listType != null) {
      request = request + "/${listType.value}";
    }
    return await _getList<ListItem>(request, pagination: pagination);
  }

  Future<List<Comment>> getListComments(String id,
      {ListCommentsSortBy sort = ListCommentsSortBy.newest,
      RequestPagination? pagination}) async {
    return await _getList<Comment>("lists/$id/comments/${sort.value}",
        pagination: pagination);
  }
}
