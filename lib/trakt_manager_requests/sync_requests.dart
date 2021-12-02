part of trakt_dart;

/// Syncing with trakt opens up quite a few cool features.
/// Most importantly, trakt can serve as a cloud based backup for the data in your app.
/// This is especially useful when rebuilding a media center or installing a mobile app on your new phone.
/// It can also be nice to sync up multiple media centers with a central trakt account.
/// If everything is in sync, your media can be managed from trakt and be reflected in your apps
///
/// Media objects for syncing
///
/// As a baseline, all add and remove sync methods accept arrays of movies, shows, and episodes.
/// Each of these top level array elements should themselves be an array of standard movie, show, or episode objects.
/// Full examples are in the intro section called Standard Media Objects.
/// Keep in mind that episode objects really only need the ids so it can find an exact match.
/// This is useful for absolute ordered shows. Some methods also have optional metadata you can attach,
/// so check the docs for each specific method.Media objects will be matched by ID first, then fall back to title and year.
/// IDs will be matched in this order trakt, imdb, tmdb, tvdb, and slug. If nothing is found, it will match on the title and year.
/// If still nothing, it would use just the title (or name for people) and find the most current object that exists.
///
/// Watched History Sync
///
/// This is a 2 way sync that will get items from trakt to sync locally, plus find anything new and sync back to trakt.
/// Perform this sync on startup or at set intervals (i.e. once every day) to keep everything in sync.
/// This will only send data to trakt and not remove it.
///
/// Sync Sync
///
/// It's very handy to have a snapshot on trakt of everything you have available to watch locally.
/// Syncing your local connection will do just that. This will only send data to trakt and not remove it.
///
/// Clean Sync
///
/// Cleaning a collection involves comparing the trakt collection to what exists locally.
/// This will remove items from the trakt collection if they don't exist locally anymore.
/// You should make this clear to the user that data might be removed from trakt.
class Sync extends Category {
  Sync(TraktManager manager) : super(manager);

  /// This method is a useful first step in the syncing process.
  /// We recommended caching these dates locally, then you can compare to know exactly what data has changed recently.
  /// This can greatly optimize your syncs so you don't pull down a ton of data only to see nothing has actually changed.
  ///
  /// Account
  ///
  /// settings_at is set when the OAuth user updates any of their Trakt settings on the website.
  /// followed_at is set when another Trakt user follows or unfollows the OAuth user.
  /// following_at is set when the OAuth user follows or unfollows another Trakt user.
  /// pending_at is set when the OAuth user follows a private account, which requires their approval.
  ///
  /// 🔒 OAuth Required
  Future<SyncActivity> getLatestActivities() async {
    return await _manager
        ._authenticatedGet<SyncActivity>("sync/last_activities");
  }

  /// Whenever a scrobble is paused, the playback progress is saved.
  ///
  /// Use this progress to sync up playback across different media centers or apps.
  /// For example, you can start watching a movie in a media center, stop it, then resume on your tablet from the same spot.
  /// Each item will have the progress percentage between 0 and 100.
  ///
  /// You can optionally specify a type to only get movies or episodes.
  ///
  /// By default, all results will be returned. Pagination is optional and can be used for something like an "on deck" feature,
  /// or if you only need a limited data set.
  ///
  /// [type]- Possible values:  movies , episodes .
  /// [startAt] - Starting date. Example: 2016-06-01T00:00:00.000Z
  /// [endAt] - Starting date. Example: 2016-06-01T00:00:00.000Z
  ///
  /// 🔒 OAuth Required 📄 Pagination Optional
  Future<List<PlaybackProgress>> getPlaybackProgress(
      {PlaybackProgressItemType? type,
      String? startAt,
      String? endAt,
      RequestPagination? pagination}) async {
    Map<String, dynamic>? params;
    if (startAt != null) {
      params = {};
      params["start_at"] = startAt;
    }
    if (endAt != null) {
      params = params ?? {};
      params["end_at"] = endAt;
    }

    final request = type != null ? type.value : "";

    return await _manager._authenticatedGetList<PlaybackProgress>(
        "sync/last_activities$request",
        queryParamameters: params);
  }

  /// Remove a playback item from a user's playback progress list. A 404 will be returned if the id is invalid.
  ///
  /// [id] - playback ID Example: 13.
  ///
  /// 🔒 OAuth Required
  Future<void> removePlaybackItem(int id) async {
    return await _manager._authenticatedDelete("sync/playback/$id");
  }

  /// Get all collected items in a user's collection.
  ///
  /// A collected item indicates availability to watch digitally or on physical media.
  ///
  /// Each movie object contains collected_at and updated_at timestamps. Since users can set custom dates when they
  /// collected movies, it is possible for collected_at to be in the past. We also include updated_at to help sync
  /// Trakt data with your app. Cache this timestamp locally and only re-process the movie if you see a newer timestamp.
  ///
  /// Each show object contains last_collected_at and last_updated_at timestamps. Since users can set custom dates when
  /// they collected episodes, it is possible for last_collected_at to be in the past. We also include last_updated_at to
  /// help sync Trakt data with your app. Cache this timestamp locally and only re-process the show if you see a newer timestamp.
  ///
  /// If you add ?extended=metadata to the URL, it will return the additional media_type, resolution, hdr, audio,
  /// audio_channels and '3d' metadata. It will use null if the metadata isn't set for an item.
  ///
  /// [type] - Possible values:  movies , shows .
  ///
  /// 🔒 OAuth Required ✨ Extended Info
  Future<List<UserCollectionItem>> getSync(MoviesShowsType type,
      {bool extendedFull = false, bool? extendedMetadata}) async {
    Map<String, dynamic>? params;
    List<String> extended = [];
    if (extendedFull) {
      extended.add("full");
    }
    if (extendedMetadata ?? false) {
      extended.add("metadata");
    }
    if (extended.isNotEmpty) {
      params = {};
      params["extended"] = extended.join(",");
    }
    return await _manager._authenticatedGetList<UserCollectionItem>(
        "sync/collection/${type.value}",
        queryParamameters: params);
  }

  /// Add items to a user's collection. Accepts shows, seasons, episodes and movies.
  ///
  /// If only a show is passed, all episodes for the show will be collected.
  /// If seasons are specified, all episodes in those seasons will be collected.
  ///
  /// Send a collected_at UTC datetime to mark items as collected in the past.
  /// You can also send additional metadata about the media itself to have a very accurate collection.
  /// Showcase what is available to watch from your epic HD DVD collection down to your downloaded iTunes movies.
  ///
  /// Note: You can resend items already in your collection and they will be updated with any new values.
  /// This includes the collected_at and any other metadata.
  ///
  /// [movies] - a list of tuples consisting of a Movie and optional fields to be added.
  /// [shows] - a list of tuples consisting of a Movie and optional fields to be added.
  /// [seasons] - a list of tuples consisting of a Movie and optional fields to be added.
  /// [episodes] - a list of tuples consisting of a Movie and optional fields to be added.
  ///
  /// 🔒 OAuth Required
  Future<AddToSyncResponse> addToCollection({
    List<Tuple2<Movie, CollectionItemPostData?>> movies = const [],
    List<Tuple2<Show, CollectionItemPostData?>> shows = const [],
    List<Tuple2<Season, CollectionItemPostData?>> seasons = const [],
    List<Tuple2<Episode, CollectionItemPostData?>> episodes = const [],
  }) async {
    Map<String, dynamic> body = {};
    if (movies.isNotEmpty) {
      body["movies"] = movies.map((tuple) {
        final meta = tuple.item1.metadata;
        if (tuple.item2 != null) {
          meta.addAll(tuple.item2!.toMap());
        }
        return meta;
      }).toList();
    }
    if (shows.isNotEmpty) {
      body["shows"] = shows.map((tuple) {
        final meta = tuple.item1.metadata;
        if (tuple.item2 != null) {
          meta.addAll(tuple.item2!.toMap());
        }
        return meta;
      }).toList();
    }
    if (seasons.isNotEmpty) {
      body["seasons"] = seasons.map((tuple) {
        final meta = tuple.item1.metadata;
        if (tuple.item2 != null) {
          meta.addAll(tuple.item2!.toMap());
        }
        return meta;
      }).toList();
    }
    if (episodes.isNotEmpty) {
      body["episodes"] = episodes.map((tuple) {
        final meta = tuple.item1.metadata;
        if (tuple.item2 != null) {
          meta.addAll(tuple.item2!.toMap());
        }
        return meta;
      }).toList();
    }
    return await _manager._authenticatedPost<AddToSyncResponse>(
        "sync/collection",
        body: jsonEncode(body));
  }

  /// Remove one or more items from a user's collection.
  ///
  /// 🔒 OAuth Required 😁 Emojis
  Future<RemoveFromSyncResponse> removeFromSync(
      {List<Movie> movies = const [],
      List<Show> shows = const [],
      List<Season> seasons = const [],
      List<Episode> episodes = const []}) async {
    Map<String, dynamic> body = {};
    if (movies.isNotEmpty) {
      body["movies"] = movies.map((movie) => movie.metadata).toList();
    }

    if (shows.isNotEmpty) {
      body["shows"] = shows.map((show) => show.metadata).toList();
    }

    if (seasons.isNotEmpty) {
      body["seasons"] = seasons.map((season) => season.metadata).toList();
    }

    if (episodes.isNotEmpty) {
      body["episodes"] = episodes.map((episode) => episode.metadata).toList();
    }

    return await _manager._authenticatedPost<RemoveFromSyncResponse>(
        "sync/collection/remove",
        body: jsonEncode(body));
  }

  /// Returns all movies or shows a user has watched sorted by most plays.
  ///
  /// If type is set to shows and you add ?extended=noseasons to the URL, it won't return season or episode info.
  ///
  /// Each movie and show object contains last_watched_at and last_updated_at timestamps.
  /// Since users can set custom dates when they watched movies and episodes, it is possible for last_watched_at to be in the past.
  /// We also include last_updated_at to help sync Trakt data with your app. Cache this timestamp locally and only re-process
  /// the movies and shows if you see a newer timestamp.Each show object contains a reset_at timestamp.
  /// If not null, this is when the user started re-watching the show. Your app can adjust the progress by ignoring
  /// episodes with a last_watched_at prior to the reset_at.
  ///
  /// [type] - Possible values:  movies , shows .
  ///
  /// 🔒 OAuth Required ✨ Extended Info
  Future<List<WatchedItem>> getWatched(MoviesShowsType type,
      {bool extendedFull = false, bool? extendedNoSeasons}) async {
    Map<String, dynamic>? params;
    List<String> extended = [];
    if (extendedFull) {
      extended.add("full");
    }
    if ((extendedNoSeasons ?? false) && type == MoviesShowsType.shows) {
      extended.add("noseasons");
    }
    if (extended.isNotEmpty) {
      params = {};
      params["extended"] = extended.join(",");
    }

    return await _manager._authenticatedGetList<WatchedItem>(
        "sync/watched/${type.value}",
        queryParamameters: params);
  }

  /// Returns movies and episodes that a user has watched, sorted by most recent.
  ///
  /// You can optionally limit the type to movies or episodes. The id (64-bit integer) in each history
  /// item uniquely identifies the event and can be used to remove individual events by using the
  /// /sync/history/remove method. The action will be set to scrobble, checkin, or watch.
  ///
  /// Specify a type and trakt id to limit the history for just that item.
  /// If the id is valid, but there is no history, an empty array will be returned.
  ///
  /// [type] - Possible values:  movies , shows , seasons , episodes
  /// [itemId] - Trakt ID for a specific item
  /// [startAt] - Starting date
  /// [endAt] - Ending data
  ///
  /// 🔓 OAuth Optional 📄 Pagination ✨ Extended Info
  Future<List<HistoryItem>> getHistory(
      {WatchedItemType? type,
      String? itemId,
      String? startAt,
      String? endAt,
      bool extendedFull = false,
      RequestPagination? pagination}) async {
    var request = "sync/history";
    if (type != null && itemId != null) {
      request += "/${type.value}/$itemId";
    }

    Map<String, dynamic>? params;
    if (startAt != null) {
      params = {};
      params["start_at"] = startAt;
    }

    if (endAt != null) {
      params = params ?? {};
      params["end_at"] = endAt;
    }

    return await _manager._authenticatedGetList<HistoryItem>(request,
        extendedFull: extendedFull,
        pagination: pagination,
        queryParamameters: params);
  }

  /// Add items to a user's watch history.
  ///
  /// Accepts shows, seasons, episodes and movies. If only a show is passed, all episodes for the show will be added.
  /// If seasons are specified, only episodes in those seasons will be added.
  ///
  /// Send a watched_at UTC datetime to mark items as watched in the past.
  /// This is useful for syncing past watches from a media center.
  ///
  /// [movies] - a list of tuples consisting of a Movie and optional watched_at to be added.
  /// [shows] -  a list of tuples consisting of a Show and optional watched_at to be added.
  ///
  /// 🔒 OAuth Required
  Future<AddToSyncResponse> addToHistory({
    List<Tuple2<Movie, String?>> movies = const [],
    List<Tuple2<Show, String?>> shows = const [],
    List<Tuple2<Season, String?>> seasons = const [],
    List<Tuple2<Episode, String?>> episodes = const [],
  }) async {
    Map<String, dynamic> body = {};
    if (movies.isNotEmpty) {
      body["movies"] = movies.map((tuple) {
        final meta = tuple.item1.metadata;
        if (tuple.item2 != null) {
          meta["watched_at"] = tuple.item2;
        }
        return meta;
      }).toList();
    }
    if (shows.isNotEmpty) {
      body["shows"] = shows.map((tuple) {
        final meta = tuple.item1.metadata;
        if (tuple.item2 != null) {
          meta["watched_at"] = tuple.item2;
        }
        return meta;
      }).toList();
    }
    if (seasons.isNotEmpty) {
      body["seasons"] = seasons.map((tuple) {
        final meta = tuple.item1.metadata;
        if (tuple.item2 != null) {
          meta["watched_at"] = tuple.item2;
        }
        return meta;
      }).toList();
    }
    if (episodes.isNotEmpty) {
      body["episodes"] = episodes.map((tuple) {
        final meta = tuple.item1.metadata;
        if (tuple.item2 != null) {
          meta["watched_at"] = tuple.item2;
        }
        return meta;
      }).toList();
    }
    return await _manager._authenticatedPost<AddToSyncResponse>("sync/history",
        body: jsonEncode(body));
  }

  /// Remove items from a user's watch history including all watches, scrobbles, and checkins.
  ///
  /// Accepts shows, seasons, episodes and movies. If only a show is passed, all episodes for the show will be removed.
  /// If seasons are specified, only episodes in those seasons will be removed.
  ///
  /// You can also send a list of raw history ids (64-bit integers) to delete single plays from the watched history.
  /// The /sync/history method will return an individual id (64-bit integer) for each history item.
  ///
  /// 🔒 OAuth Required
  Future<RemoveFromSyncResponse> removeFromHistory(
      {List<Movie> movies = const [],
      List<Show> shows = const [],
      List<Season> seasons = const [],
      List<Episode> episodes = const []}) async {
    Map<String, dynamic> body = {};
    if (movies.isNotEmpty) {
      body["movies"] = movies.map((movie) => movie.metadata).toList();
    }

    if (shows.isNotEmpty) {
      body["shows"] = shows.map((show) => show.metadata).toList();
    }

    if (seasons.isNotEmpty) {
      body["seasons"] = seasons.map((season) => season.metadata).toList();
    }

    if (episodes.isNotEmpty) {
      body["episodes"] = episodes.map((episode) => episode.metadata).toList();
    }
    return await _manager._authenticatedPost<RemoveFromSyncResponse>(
        "sync/history/remove",
        body: jsonEncode(body));
  }

  /// Get a user's ratings filtered by type.
  ///
  /// You can optionally filter for a specific rating between 1 and 10.
  /// Send a comma separated string for rating if you need multiple ratings.
  ///
  /// [type] - Possible values:  movies , shows , seasons , episodes , all .
  /// [ratings] - Filter for a specific rating. Possible values:  1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 , 9 , 10 .
  ///
  /// 🔒 OAuth Required 📄 Pagination Optional ✨ Extended Info
  Future<List<RatedItem>> getRatings(
      {MediaType? type,
      List<int>? ratings,
      bool extendedFull = false,
      RequestPagination? pagination}) async {
    var request = "sync/ratings";
    if (type != null) {
      request += "/${type.value}";
      if (ratings?.isNotEmpty ?? false) {
        request += "/${ratings!.join(",")}";
      }
    }

    return await _manager._authenticatedGetList<RatedItem>(request,
        extendedFull: extendedFull, pagination: pagination);
  }

  /// Rate one or more items. Accepts shows, seasons, episodes and movies.
  ///
  /// If only a show is passed, only the show itself will be rated. If seasons are specified, all of
  /// those seasons will be rated.Send a rated_at UTC datetime to mark items as rated in the past.
  /// This is useful for syncing ratings from a media center.
  ///
  /// [movies] - Movies to add
  /// [shows] - Shows to add
  /// [seasons] - Seasons to add
  /// [episodes] - Episodes to add
  ///
  /// 🔒 OAuth Required
  Future<AddToSyncResponse> addToRatings(
      {List<Movie> movies = const [],
      List<Show> shows = const [],
      List<Season> seasons = const [],
      List<Episode> episodes = const []}) async {
    Map<String, dynamic> body = {};
    if (movies.isNotEmpty) {
      body["movies"] = movies.map((movie) => movie.metadata).toList();
    }

    if (shows.isNotEmpty) {
      body["shows"] = shows.map((show) => show.metadata).toList();
    }

    if (seasons.isNotEmpty) {
      body["seasons"] = seasons.map((season) => season.metadata).toList();
    }

    if (episodes.isNotEmpty) {
      body["episodes"] = episodes.map((episode) => episode.metadata).toList();
    }
    return await _manager._authenticatedPost<AddToSyncResponse>("sync/ratings",
        body: jsonEncode(body));
  }

  /// Remove ratings for one or more items.
  ///
  /// 🔒 OAuth Required
  Future<RemoveFromSyncResponse> removeFromRatings(
      {List<Movie> movies = const [],
      List<Show> shows = const [],
      List<Season> seasons = const [],
      List<Episode> episodes = const []}) async {
    Map<String, dynamic> body = {};
    if (movies.isNotEmpty) {
      body["movies"] = movies.map((movie) => movie.metadata).toList();
    }

    if (shows.isNotEmpty) {
      body["shows"] = shows.map((show) => show.metadata).toList();
    }

    if (seasons.isNotEmpty) {
      body["seasons"] = seasons.map((season) => season.metadata).toList();
    }

    if (episodes.isNotEmpty) {
      body["episodes"] = episodes.map((episode) => episode.metadata).toList();
    }

    return await _manager._authenticatedPost<RemoveFromSyncResponse>(
        "sync/ratings/remove",
        body: jsonEncode(body));
  }

  /// Returns all items in a user's watchlist filtered by type.
  ///
  /// Sorting Headers
  ///
  /// By default, all list items are sorted by rank asc. We send X-Applied-Sort-By and X-Applied-Sort-How headers
  /// to indicate how the results are actually being sorted.We also send X-Sort-By and X-Sort-How headers which
  /// indicate the user's sort preference. Use these to to custom sort the watchlist in your app for more advanced
  /// sort abilities we can't do in the API. Values for X-Sort-By include rank, added, title, released, runtime, popularity,
  /// percentage, and votes. Values for X-Sort-How include asc and desc.
  ///
  /// Auto Removal
  ///
  /// When an item is watched, it will be automatically removed from the watchlist.
  /// For shows and seasons, watching 1 episode will remove the entire show or season.
  ///
  /// The watchlist should not be used as a list of what the user is actively watching.
  ///
  /// Use a combination of the /sync/watched and /shows/:id/progress methods to get what the user is actively watching.
  ///
  /// [type] - Possible values:  movies , shows , seasons , episodes.
  /// [sortBy] - How to sort (only if type is also sent). Possible values:  rank , added , released , title .
  ///
  /// 🔒 OAuth Required 📄 Pagination Optional ✨ Extended Info
  Future<List<WatchlistItem>> getWatchlist(
      {WatchedItemType? type,
      SortBy? sortBy,
      bool extendedFull = false,
      RequestPagination? pagination}) async {
    var request = "sync/watchlist";
    if (type != null) {
      request += "/${type.value}";
      if (sortBy != null) {
        request += "/${sortBy.value}";
      }
    }

    return await _manager._authenticatedGetList<WatchlistItem>(request,
        extendedFull: extendedFull, pagination: pagination);
  }

  /// Add one of more items to a user's watchlist.
  ///
  /// Accepts shows, seasons, episodes and movies. If only a show is passed, only the show itself will be added.
  /// If seasons are specified, all of those seasons will be added.
  ///
  /// [movies] - Movies to add
  /// [shows] - Shows to add
  /// [seasons] - Seasons to add
  /// [episodes] - Episodes to add
  ///
  /// 🔒 OAuth Required
  Future<AddToSyncResponse> addToWatchlist(
      {List<Movie> movies = const [],
      List<Show> shows = const [],
      List<Season> seasons = const [],
      List<Episode> episodes = const []}) async {
    Map<String, dynamic> body = {};
    if (movies.isNotEmpty) {
      body["movies"] = movies.map((movie) => movie.metadata).toList();
    }

    if (shows.isNotEmpty) {
      body["shows"] = shows.map((show) => show.metadata).toList();
    }

    if (seasons.isNotEmpty) {
      body["seasons"] = seasons.map((season) => season.metadata).toList();
    }

    if (episodes.isNotEmpty) {
      body["episodes"] = episodes.map((episode) => episode.metadata).toList();
    }

    return await _manager._authenticatedPost<AddToSyncResponse>(
        "sync/watchlist",
        body: jsonEncode(body));
  }

  /// Remove one or more items from a user's watchlist.
  ///
  /// 🔒 OAuth Required
  Future<RemoveFromSyncResponse> removeFromWatchlist(
      {List<Movie> movies = const [],
      List<Show> shows = const [],
      List<Season> seasons = const [],
      List<Episode> episodes = const []}) async {
    Map<String, dynamic> body = {};
    if (movies.isNotEmpty) {
      body["movies"] = movies.map((movie) => movie.metadata).toList();
    }

    if (shows.isNotEmpty) {
      body["shows"] = shows.map((show) => show.metadata).toList();
    }

    if (seasons.isNotEmpty) {
      body["seasons"] = seasons.map((season) => season.metadata).toList();
    }

    if (episodes.isNotEmpty) {
      body["episodes"] = episodes.map((episode) => episode.metadata).toList();
    }

    return await _manager._authenticatedPost<RemoveFromSyncResponse>(
        "sync/watchlist/remove",
        body: jsonEncode(body));
  }

  /// Reorder all items on a user's watchlist by sending the updated rank of list item ids.
  ///
  /// Use the /sync/watchlist method to get all list item ids.
  ///
  /// [listIds] - the updated rank of list ids.
  ///
  /// 🔒 OAuth Required
  Future<ReorderListResponse> reorderWatchlists(List<int> listIds) async {
    return await _manager._authenticatedPost<ReorderListResponse>(
        "sync/watchlist/reorder",
        body: jsonEncode({"rank": listIds}));
  }

  /// Returns all items a user personally recommendeds to others including optional notes explaining why they recommended an item.
  ///
  /// These recommendations are used to enchance Trakt's social recommendation algorithm.
  /// Apps should encourage user's to build their personal recommendations so the algorithm keeps getting better.
  ///
  /// [type] - Possible values:  movies , shows.
  /// [sortBy] - How to sort (only if type is also sent). Possible values:  rank , added , released , title .
  ///
  /// 🔒 OAuth Required 📄 Pagination Optional ✨ Extended Info 😁 Emojis
  Future<List<PersonalRecommendation>> getPersonalRecommendations(
      {MoviesShowsType? type,
      SortBy? sortBy,
      bool extendedFull = false,
      RequestPagination? pagination}) async {
    var request = "";
    if (type != null) {
      request += "/${type.value}";
      if (sortBy != null) {
        request += "/${sortBy.value}";
      }
    }
    return await _manager._authenticatedGetList<PersonalRecommendation>(
        "sync/recommendations$request",
        extendedFull: extendedFull,
        pagination: pagination);
  }

  /// Add items to a user's personal recommendations including optional notes (255 maximum characters)
  /// explaining why they recommended an item. These recommendations are used to enchance Trakt's social
  /// recommendation algorithm. Apps should encourage user's to build their personal recommendations so
  /// the algorithm keeps getting better.
  ///
  /// [movies] - a list of tuples consisting of a Movie and optional note to be added.
  /// [shows] -  a list of tuples consisting of a Show and optional note to be added.
  ///
  /// 🔒 OAuth Required 😁 Emojis
  Future<AddToSyncResponse> addToPersonalRecommendations({
    List<Tuple2<Movie, String?>> movies = const [],
    List<Tuple2<Show, String?>> shows = const [],
  }) async {
    Map<String, dynamic> body = {};
    if (movies.isNotEmpty) {
      body["movies"] = movies.map((tuple) {
        final meta = tuple.item1.metadata;
        if (tuple.item2 != null) {
          meta["note"] = tuple.item2;
        }
        return meta;
      }).toList();
    }
    if (shows.isNotEmpty) {
      body["shows"] = shows.map((tuple) {
        final meta = tuple.item1.metadata;
        if (tuple.item2 != null) {
          meta["note"] = tuple.item2;
        }
        return meta;
      }).toList();
    }

    return await _manager._authenticatedPost<AddToSyncResponse>(
        "sync/recommendations",
        body: jsonEncode(body));
  }

  /// Remove items from a user's personal recommendations.
  ///
  /// These recommendations are used to enchance Trakt's social recommendation algorithm.
  /// Apps should encourage user's to build their personal recommendations so the algorithm keeps getting better.
  ///
  /// 🔒 OAuth Required
  Future<RemoveFromSyncResponse> removeFromPersonalRecommendations(
      {List<Movie> movies = const [], List<Show> shows = const []}) async {
    Map<String, dynamic> body = {};
    if (movies.isNotEmpty) {
      body["movies"] = movies.map((movie) => movie.metadata).toList();
    }

    if (shows.isNotEmpty) {
      body["shows"] = shows.map((show) => show.metadata).toList();
    }

    return await _manager._authenticatedPost<RemoveFromSyncResponse>(
        "sync/recommendations/remove",
        body: jsonEncode(body));
  }

  /// Reorder all items on a user's personal recommendations by sending the updated rank of list item ids.
  ///
  /// Use the /sync/recommendations method to get all list item ids.
  ///
  /// [ids] - the updated rank of recommendation ids.
  ///
  /// 🔒 OAuth Required
  Future<ReorderListResponse> reorderPersonalRecommendations(
      List<int> ids) async {
    return await _manager._authenticatedPost<ReorderListResponse>(
        "sync/recommendations/reorder",
        body: jsonEncode({"rank": ids}));
  }
}
