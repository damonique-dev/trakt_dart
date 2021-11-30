part of trakt_dart;

class Lists extends Category {
  Lists(TraktManager manager) : super(manager);

  /// Returns all lists with the most likes and comments over the last 7 days.
  ///
  /// 📄 Pagination 😁 Emojis
  Future<List<TrendingPopularList>> getTrendingLists(
      {RequestPagination? pagination}) async {
    return await _manager._getList<TrendingPopularList>("lists/trending",
        pagination: pagination);
  }

  /// Returns the most popular lists. Popularity is calculated using total number of likes and comments.
  ///
  /// 📄 Pagination 😁 Emojis
  Future<List<TrendingPopularList>> getPopularLists(
      {RequestPagination? pagination}) async {
    return await _manager._getList<TrendingPopularList>("lists/popular",
        pagination: pagination);
  }

  /// Returns a single list.
  /// Use the /lists/:id/items method to get the actual items this list contains.
  ///
  /// Note: You must use an integer id, and only public lists will return data.
  ///
  /// [id] - Trakt ID
  ///
  /// 😁 Emojis
  Future<TraktList> getList(int id) async {
    return await _manager._get<TraktList>("lists/$id");
  }

  /// Returns all users who liked a list.
  ///
  /// [id] - Trakt ID
  ///
  /// 📄 Pagination
  Future<List<ListLikes>> getListLikes(int id,
      {RequestPagination? pagination}) async {
    return await _manager._getList<ListLikes>("lists/$id/likes",
        pagination: pagination);
  }

  /// Get all items on a custom list.
  ///
  /// Items can be a movie, show, season, episode, or person.
  /// You can optionally specify the type parameter with a single value or comma delimited string for multiple item types.
  /// All list items are sorted by ascending rank
  ///
  /// [id] - Trakt ID
  /// [listType] - Filter for a specific item type
  ///
  /// 📄 Pagination ✨ Extended Info 😁 Emojis
  Future<List<ListItem>> getListItems(
    int id, {
    ListType? listType,
    RequestPagination? pagination,
    bool extendedFull = false,
  }) async {
    var request = "lists/$id/items";
    if (listType != null) {
      request = request + "/${listType.value}";
    }
    return await _manager._getList<ListItem>(request, pagination: pagination);
  }

  /// Returns all top level comments for a list.
  ///
  /// By default, the newest comments are returned first. Other sorting options include oldest, most likes, and most replies.
  ///
  /// [id] - Trakt ID
  /// [sort] - How to sort
  ///
  /// 📄 Pagination 😁 Emojis
  Future<List<Comment>> getListComments(int id,
      {ListCommentsSortBy sort = ListCommentsSortBy.newest,
      RequestPagination? pagination}) async {
    return await _manager._getList<Comment>("lists/$id/comments/${sort.value}",
        pagination: pagination);
  }
}
