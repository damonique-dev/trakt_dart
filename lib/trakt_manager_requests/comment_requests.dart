part of trakt_dart;

class Comments extends Category {
  Comments(TraktManager manager) : super(manager);

  /// Add a new comment to a movie, show, season, episode, or list.
  /// Make sure to allow and encourage spoilers to be indicated in your app and follow the rules listed above.
  ///
  /// The sharing object is optional and will apply the user's settings if not sent.
  /// If sharing is sent, each key will override the user's setting for that social network.
  /// Send true to post or false to not post on the indicated social network.
  /// You can see which social networks a user has connected with the /users/settings method.
  ///
  /// [comment] - Text for the comment.
  /// [spoiler] - Is this a spoiler?
  /// [sharing] - Control sharing to any connected social networks.
  /// [movie, show, season, episode, list] - The item to comment on.
  ///
  /// 🔒 OAuth Required 😁 Emojis
  Future<CommentResponse> postComment(
      {required String comment,
      required bool spoiler,
      Movie? movie,
      Show? show,
      Season? season,
      Episode? episode,
      TraktList? list,
      CommentSharing? sharing}) async {
    assert(
        (movie != null ||
            show != null ||
            season != null ||
            episode != null ||
            list != null),
        "A movie, show, season, episode, or list must be provided");
    final Map<String, dynamic> body = {"comment": comment, "spoiler": spoiler};

    if (movie != null) {
      body["movie"] = movie.metadata;
    }

    if (show != null) {
      body["show"] = show.metadata;
    }

    if (season != null) {
      body["season"] = season.metadata;
    }

    if (episode != null) {
      body["episode"] = episode.metadata;
    }

    if (list != null) {
      body["list"] = {
        "ids": list.ids,
      };
    }

    if (sharing != null) {
      body["sharing"] = sharing.toJson();
    }

    return await _manager._authenticatedPost<CommentResponse>("comments",
        body: jsonEncode(body));
  }

  /// Returns a single comment and indicates how many replies it has.
  ///
  /// Use /comments/:id/replies to get the actual replies.
  ///
  /// [id] - A specific comment ID
  ///
  /// 😁 Emojis
  Future<CommentResponse> getComment(String id) async {
    return await _manager._get<CommentResponse>("comments/$id");
  }

  /// Update a single comment.
  ///
  /// The OAuth user must match the author of the comment in order to update it. If not, a 401 HTTP status is returned.
  ///
  /// [id] - A specific comment ID
  ///
  /// 🔒 OAuth Required 😁 Emojis
  Future<CommentResponse> updateCommentOrReply(String id,
      {required String comment, required bool spoiler}) async {
    final body = {"comment": comment, "spoiler": spoiler};
    return await _manager._authenticatedPut<CommentResponse>("comments/$id",
        body: jsonEncode(body));
  }

  /// Delete a single comment.
  ///
  /// The OAuth user must match the author of the comment in order to delete it.
  /// If not, a 401 HTTP status code is returned.
  ///
  /// The comment must also be less than 2 weeks old or have 0 replies. If not, a 409 HTTP status is returned.
  ///
  /// [id] - A specific comment ID
  ///
  /// 🔒 OAuth Required
  Future<void> deleteCommentOrReply(String id) async {
    return await _manager._authenticatedDelete("comments/$id");
  }

  /// Returns all replies for a comment.
  ///
  /// It is possible these replies could have replies themselves, so in that case you would just call /comments/:id/replies again with the new comment id.
  ///
  /// [id] - A specific comment ID
  ///
  /// 📄 Pagination 😁 Emojis
  Future<List<CommentResponse>> getReplies(String id,
      {RequestPagination? pagination}) async {
    return await _manager._getList<CommentResponse>("comments/$id/replies",
        pagination: pagination);
  }

  /// Add a new reply to an existing comment.
  ///
  /// Make sure to allow and encourage spoilers to be indicated in your app and follow the rules listed above.
  ///
  /// [id] - A specific comment ID
  ///
  /// 🔒 OAuth Required 😁 Emojis
  Future<CommentResponse> postCommentReply(String id,
      {required String comment, required bool spoiler}) async {
    final body = {"comment": comment, "spoiler": spoiler};
    return await _manager._authenticatedPost<CommentResponse>(
        "comments/$id/replies",
        body: jsonEncode(body));
  }

  /// Returns the media item this comment is attached to.
  ///
  /// The media type can be movie, show, season, episode, or list and it also returns the standard media object for that media type.
  ///
  /// [id] - A specific comment ID
  ///
  /// ✨ Extended Info
  Future<CommentMediaItem> getCommentMediaItem(String id,
      {bool extendedFull = false}) async {
    return await _manager._get<CommentMediaItem>("comments/$id/item",
        extendedFull: extendedFull);
  }

  /// Returns all users who liked a comment.
  ///
  /// If you only need the replies count, the main comment object already has that, so no need to use this method.
  ///
  /// [id] - A specific comment ID
  ///
  /// 📄 Pagination
  Future<List<CommentLike>> getCommentLikes(String id,
      {RequestPagination? pagination}) async {
    return await _manager._getList<CommentLike>("comments/$id/likes",
        pagination: pagination);
  }

  /// Votes help determine popular comments. Only one like is allowed per comment per user.
  ///
  /// [id] - A specific comment ID
  ///
  /// 🔒 OAuth Required
  Future<void> likeComment(String id) async {
    return await _manager._authenticatedPost("comments/$id/like");
  }

  /// Remove a like on a comment.
  ///
  /// [id] - A specific comment ID
  ///
  /// 🔒 OAuth Required
  Future<void> removeLikeComment(String id) async {
    return await _manager._authenticatedDelete("comments/$id/like");
  }

  /// Returns all comments with the most likes and replies over the last 7 days.
  ///
  /// You can optionally filter by the [commentType] and [mediaType] to limit what gets returned.
  /// If you want to [includeReplies] that will return replies in place alongside top level comments.
  ///
  /// [commentType] - Possible values:  all , reviews , shouts .
  /// [mediaType] - Possible values:  all , movies , shows , seasons , episodes , lists .
  /// [includeReplies] - include comment replies
  ///
  /// 📄 Pagination ✨ Extended Info 😁 Emojis
  Future<List<MediaComment>> getTrendingComments(
      {CommentType? commentType,
      MediaType? mediaType,
      bool? includeReplies,
      bool extendedFull = false,
      RequestPagination? pagination}) async {
    Map<String, dynamic>? params;
    if (includeReplies ?? false) {
      params = {"include_replies": includeReplies};
    }
    var request = "";
    if (commentType != null) {
      request = "/${commentType.value}";
    }

    if (mediaType != null) {
      request += "/${mediaType.value}";
    }

    return await _manager._getList<MediaComment>("comments/trending$request",
        extendedFull: extendedFull,
        pagination: pagination,
        queryParamameters: params);
  }

  /// Returns the most recently written comments across all of Trakt.
  ///
  /// You can optionally filter by the [commentType] and [mediaType] to limit what gets returned.
  /// If you want to [includeReplies] that will return replies in place alongside top level comments.
  ///
  /// [commentType] - Possible values:  all , reviews , shouts .
  /// [mediaType] - Possible values:  all , movies , shows , seasons , episodes , lists .
  /// [includeReplies] - include comment replies
  ///
  /// 📄 Pagination ✨ Extended Info 😁 Emojis
  Future<List<MediaComment>> getRecentComments(
      {CommentType? commentType,
      MediaType? mediaType,
      bool? includeReplies,
      bool extendedFull = false,
      RequestPagination? pagination}) async {
    Map<String, dynamic>? params;
    if (includeReplies ?? false) {
      params = {"include_replies": includeReplies};
    }
    var request = "";
    if (commentType != null) {
      request = "/${commentType.value}";
    }

    if (mediaType != null) {
      request += "/${mediaType.value}";
    }

    return await _manager._getList<MediaComment>("comments/recent$request",
        extendedFull: extendedFull,
        pagination: pagination,
        queryParamameters: params);
  }

  /// Returns the most recently written comments across all of Trakt.
  ///
  /// You can optionally filter by the [commentType] and [mediaType] to limit what gets returned.
  /// If you want to [includeReplies] that will return replies in place alongside top level comments.
  ///
  /// [commentType] - Possible values:  all , reviews , shouts .
  /// [mediaType] - Possible values:  all , movies , shows , seasons , episodes , lists .
  /// [includeReplies] - include comment replies
  ///
  /// 📄 Pagination ✨ Extended Info 😁 Emojis
  Future<List<MediaComment>> getUpdatedComments(
      {CommentType? commentType,
      MediaType? mediaType,
      bool? includeReplies,
      bool extendedFull = false,
      RequestPagination? pagination}) async {
    Map<String, dynamic>? params;
    if (includeReplies ?? false) {
      params = {"include_replies": includeReplies};
    }
    var request = "";
    if (commentType != null) {
      request = "/${commentType.value}";
    }

    if (mediaType != null) {
      request += "/${mediaType.value}";
    }

    return await _manager._getList<MediaComment>("comments/updates$request",
        extendedFull: extendedFull,
        pagination: pagination,
        queryParamameters: params);
  }
}
