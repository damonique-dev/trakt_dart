part of trakt_dart;

class Users extends Category {
  Users(TraktManager manager) : super(manager);

  /// Get the user's settings so you can align your app's experience with what they're used to on the trakt website.
  ///
  /// A globally unique uuid is also returned, which can be used to identify the user locally in your app if needed.
  /// However, the uuid can't be used to retrieve data from the Trakt API.
  ///
  /// 🔒 OAuth Required
  Future<UserSettings> getSettings() async {
    return await _manager._authenticatedGet<UserSettings>("users/settings");
  }

  /// List a user's pending following requests that they're waiting for the other user's to approve.
  ///
  /// 🔒 OAuth Required ✨ Extended Info
  Future<List<FollowRequest>> getFollowingRequests(
      {bool extendedFull = false}) async {
    return await _manager._authenticatedGetList<FollowRequest>(
        "users/requests/following",
        extendedFull: extendedFull);
  }

  /// List a user's pending follow requests so they can either approve or deny them.
  ///
  /// 🔒 OAuth Required ✨ Extended Info
  Future<List<FollowRequest>> getFollowerRequests(
      {bool extendedFull = false}) async {
    return await _manager._authenticatedGetList<FollowRequest>(
        "users/requests/following",
        extendedFull: extendedFull);
  }

  /// Approve a follower using the id of the request.
  ///
  /// If the id is not found, was already approved, or was already denied, a 404 error will be returned.
  ///
  /// [id] - ID of the follower request.
  ///
  /// 🔒 OAuth Required
  Future<Follower> approveFollowerRequest(int id) async {
    return await _manager._authenticatedPost<Follower>("users/requests/$id");
  }

  /// Deny a follower using the id of the request.
  ///
  /// If the id is not found, was already approved, or was already denied, a 404 error will be returned.
  ///
  /// [id] - ID of the follower request.
  ///
  /// 🔒 OAuth Required
  Future<void> denyFollowerRequest(int id) async {
    return await _manager._authenticatedDelete("users/requests/$id");
  }

  /// Get hidden items for a section.
  ///
  /// This will return an array of standard media objects. You can optionally limit the type of results to return.
  ///
  /// [section] - Possible values:  calendar , progress_watched , progress_watched_reset , progress_collected , recommendations .
  /// [type] - Possible values:  movie , show , season .
  ///
  /// 🔒 OAuth Required 📄 Pagination ✨ Extended Info
  Future<List<HiddenItem>> getHiddenItems(
      {required HiddenItemSection section,
      HiddenItemType? type,
      bool extendedFull = false,
      RequestPagination? pagination}) async {
    return await _manager._authenticatedGetList<HiddenItem>(
        "users/hidden/${section.value}",
        extendedFull: extendedFull,
        pagination: pagination,
        queryParamameters: (type != null) ? {"type": type.value} : null);
  }

  /// Hide items for a specific section. Here's what type of items can hidden for each section.
  ///
  /// [section] - Possible values:  calendar , progress_watched , progress_watched_reset , progress_collected , recommendations .
  /// [movies] - Movies to hide
  /// [shows] - Shows to hide
  /// [seasons] - Seasons to hide
  ///
  /// 🔒 OAuth Required
  Future<HiddenItem> addHiddenItems(
      {required HiddenItemSection section,
      List<Movie> movies = const [],
      List<Show> shows = const [],
      List<Season> seasons = const []}) async {
    Map<String, dynamic> body = {};
    final metaMovies = movies.map((movie) => movie.metadata).toList();
    final metaShows = shows.map((show) => show.metadata).toList();
    final metaSeasons = seasons.map((season) => season.metadata).toList();

    if (metaMovies.isNotEmpty) {
      body["movies"] = metaMovies;
    }
    if (metaShows.isNotEmpty) {
      body["shows"] = metaShows;
    }
    if (metaSeasons.isNotEmpty) {
      body["seasons"] = metaSeasons;
    }

    return await _manager._authenticatedPost<HiddenItem>(
        "users/hidden/${section.value}",
        body: jsonEncode(body));
  }

  /// Unhide items for a specific section. Here's what type of items can unhidden for each section.
  ///
  /// [section] - Possible values:  calendar , progress_watched , progress_watched_reset , progress_collected , recommendations .
  /// [movies] - Movies to hide
  /// [shows] - Shows to hide
  /// [seasons] - Seasons to hide
  ///
  /// 🔒 OAuth Required
  Future<HiddenItem> removeHiddenItems(
      {required HiddenItemSection section,
      List<Movie> movies = const [],
      List<Show> shows = const [],
      List<Season> seasons = const []}) async {
    Map<String, dynamic> body = {};
    final metaMovies = movies.map((movie) => movie.metadata).toList();
    final metaShows = shows.map((show) => show.metadata).toList();
    final metaSeasons = seasons.map((season) => season.metadata).toList();

    if (metaMovies.isNotEmpty) {
      body["movies"] = metaMovies;
    }
    if (metaShows.isNotEmpty) {
      body["shows"] = metaShows;
    }
    if (metaSeasons.isNotEmpty) {
      body["seasons"] = metaSeasons;
    }

    return await _manager._authenticatedPost<HiddenItem>(
        "users/hidden/${section.value}/remove",
        body: jsonEncode(body));
  }

  /// Get items a user likes.
  ///
  /// This will return an array of standard media objects. You can optionally limit the type of results to return.
  ///
  /// [type] - Possible values:  comments , lists .
  ///
  /// 🔒 OAuth Required 📄 Pagination
  Future<List<UserLike>> getLikes(
      {UserLikesType? type, RequestPagination? pagination}) async {
    return await _manager._authenticatedGetList<UserLike>("users/likes/$type",
        pagination: pagination);
  }

  /// Get a user's profile information.
  ///
  /// If the user is private, info will only be returned if you send OAuth and are either that user or an approved follower.
  /// Adding ?extended=vip will return some additional VIP related fields so you can display the user's Trakt VIP status and year count.
  ///
  /// [id] - User slug
  ///
  /// 🔓 OAuth Optional ✨ Extended Info
  Future<User> getUserProfile(String id,
      {bool extendedFull = false, bool? extendedVIP}) async {
    Map<String, dynamic>? params;
    List<String> extended = [];
    if (extendedFull) {
      extended.add("full");
    }
    if (extendedVIP ?? false) {
      extended.add("vip");
    }
    if (extended.isNotEmpty) {
      params = {};
      params["extended"] = extended.join(",");
    }
    return await _manager._authenticatedGet<User>("users/$id",
        queryParamameters: params);
  }
}
