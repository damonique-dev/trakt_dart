part of trakt_dart;

extension MovieRequests on TraktManager {
  /// Returns all movies being watched right now.
  /// Movies with the most users are returned first.
  ///
  /// 📄 Pagination ✨ Extended Info 🎚 Filters
  Future<List<TrendingMovie>> getTrendingMovies(
      {bool extendedFull = false,
      RequestPagination? pagination,
      MovieFilters? filters}) async {
    return await _getList("movies/trending",
        extendedFull: extendedFull, pagination: pagination, filters: filters);
  }

  /// Returns the most popular movies.
  /// Popularity is calculated using the rating percentage and the number of ratings.
  ///
  /// 📄 Pagination ✨ Extended Info 🎚 Filters
  Future<List<Movie>> getPopularMovies(TimePeriod period,
      {bool extendedFull = false,
      RequestPagination? pagination,
      MovieFilters? filters}) async {
    return await _getList("movies/popular",
        extendedFull: extendedFull, pagination: pagination, filters: filters);
  }

  /// Returns the most recommended movies in the specified time period, defaulting to weekly.
  /// All stats are relative to the specific time period.
  ///
  /// 📄 Pagination ✨ Extended Info 🎚 Filters
  Future<List<RecommendedMovie>> getRecommendedMovies(TimePeriod period,
      {bool extendedFull = false,
      RequestPagination? pagination,
      MovieFilters? filters}) async {
    return await _getList("movies/recommended/${period.value}",
        extendedFull: extendedFull, pagination: pagination, filters: filters);
  }

  /// Returns the most played (a single user can watch multiple times) movies in the specified time period, defaulting to weekly.
  /// All stats are relative to the specific time period.
  ///
  /// 📄 Pagination ✨ Extended Info 🎚 Filters
  Future<List<PlayedWatchedCollectedMovie>> getMostPlayedMovies(
      TimePeriod period,
      {bool extendedFull = false,
      RequestPagination? pagination,
      MovieFilters? filters}) async {
    return await _getList("movies/played/${period.value}",
        extendedFull: extendedFull, pagination: pagination, filters: filters);
  }

  /// Returns the most watched (unique users) movies in the specified time period, defaulting to weekly.
  /// All stats are relative to the specific time period.
  ///
  /// [period] - Time period. Example: weekly
  ///
  /// 📄 Pagination ✨ Extended Info 🎚 Filters
  Future<List<PlayedWatchedCollectedMovie>> getMostWatchedMovies(
      TimePeriod period,
      {bool extendedFull = false,
      RequestPagination? pagination,
      MovieFilters? filters}) async {
    return await _getList("movies/watched/${period.value}",
        extendedFull: extendedFull, pagination: pagination, filters: filters);
  }

  /// Returns the most collected (unique users) movies in the specified time period, defaulting to weekly.
  /// All stats are relative to the specific time period.
  ///
  /// [period] - Time period. Example: weekly
  ///
  /// 📄 Pagination ✨ Extended Info 🎚 Filters
  Future<List<PlayedWatchedCollectedMovie>> getMostCollectedMovies(
      TimePeriod period,
      {bool extendedFull = false,
      RequestPagination? pagination,
      MovieFilters? filters}) async {
    return await _getList("movies/collected/${period.value}",
        extendedFull: extendedFull, pagination: pagination, filters: filters);
  }

  /// Returns the most anticipated movies based on the number of lists a movie appears on.
  ///
  /// 📄 Pagination ✨ Extended Info 🎚 Filters
  Future<List<AnticipatedMovie>> getMostAnticipatedMovies(
      {bool extendedFull = false,
      RequestPagination? pagination,
      MovieFilters? filters}) async {
    return await _getList("movies/anticipated",
        extendedFull: extendedFull, pagination: pagination, filters: filters);
  }

  /// Returns the top 10 grossing movies in the U.S. box office last weekend.
  /// Updated every Monday morning.
  ///
  /// ✨ Extended Info
  Future<List<BoxOfficeMovie>> getBoxOfficeMovies(
      {bool extendedFull = false}) async {
    return await _getList("movies/boxoffice", extendedFull: extendedFull);
  }

  /// Returns all movies updated since the specified UTC date and time.
  ///
  /// We recommended storing the X-Start-Date header you can be efficient using this method moving forward.
  /// By default, 10 results are returned. You can send a limit to get up to 100 results per page.
  ///
  /// Important! The start_date is only accurate to the hour, for caching purposes.
  /// Please drop the minutes and seconds from your timestamp to help optimize our cached data.
  /// For example, use 2021-07-17T12:00:00Z and not 2021-07-17T12:23:34Z.
  ///
  /// Note: The start_date can only be a maximum of 30 days in the past.
  ///
  /// [startDate] - Updated since this date and time.
  ///
  /// 📄 Pagination ✨ Extended Info
  Future<List<UpdatedMovie>> getUpdatedMovies(String startDate,
      {bool extendedFull = false, RequestPagination? pagination}) async {
    return await _getList("movies/updates/$startDate",
        extendedFull: extendedFull, pagination: pagination);
  }

  /// Returns all movie Trakt IDs updated since the specified UTC date and time.
  ///
  /// We recommended storing the X-Start-Date header you can be efficient using this method moving forward.
  /// By default, 10 results are returned. You can send a limit to get up to 100 results per page.
  ///
  /// Important! The start_date is only accurate to the hour, for caching purposes.
  /// Please drop the minutes and seconds from your timestamp to help optimize our cached data.
  /// For example, use 2021-07-17T12:00:00Z and not 2021-07-17T12:23:34Z.
  ///
  /// Note: The start_date can only be a maximum of 30 days in the past.
  ///
  /// [startDate] - Updated since this date and time.
  ///
  /// 📄 Pagination
  Future<List<int>> getUpdatedMovieIds(String startDate,
      {RequestPagination? pagination}) async {
    return await _getIds("movies/updates/id/$startDate",
        pagination: pagination);
  }

  /// Returns a single movie's details.
  ///
  /// Note: When getting full extended info, the status field can have a value of released,
  /// in production, post production, planned, rumored, or canceled.
  ///
  /// [id] - Trakt ID, Trakt slug, or IMDB ID
  ///
  /// ✨ Extended Info
  Future<Movie> getMovieSummary(String id, {bool extendedFull = false}) async {
    return await _get<Movie>("movies/$id", extendedFull: extendedFull);
  }

  /// Returns all title aliases for a movie. Includes country where name is different.
  ///
  /// [id] - Trakt ID, Trakt slug, or IMDB ID
  Future<List<MovieShowAlias>> getMovieAliases(String id) async {
    return await _getList<MovieShowAlias>("movies/$id/aliases");
  }

  /// Returns all releases for a movie including country, certification, release date, release type, and note.
  ///
  /// The release type can be set to unknown, premiere, limited, theatrical, digital, physical, or tv.
  /// The note might have optional info such as the film festival name for a premiere release or Blu-ray specs for a physical release.
  /// We pull this info from TMDB.
  ///
  /// [id] - Trakt ID, Trakt slug, or IMDB ID
  /// [country] - 2 character country code
  Future<List<MovieRelease>> getMovieReleases(String id, String country) async {
    return await _getList<MovieRelease>("movies/$id/releases/$country");
  }

  /// Returns all translations for a movie, including language and translated values for title, tagline and overview.
  ///
  /// [id] - Trakt ID, Trakt slug, or IMDB ID
  /// [language] - 2 character language code
  ///
  /// ✨ Extended Info
  Future<List<MovieTranslation>> getMovieTranslations(String id,
      {String language = ""}) async {
    return await _getList<MovieTranslation>(
        "movies/$id/translations/$language");
  }

  /// Returns all top level comments for a movie.
  ///
  /// By default, the newest comments are returned first.
  /// Other sorting options include oldest, most likes, most replies, highest rated, lowest rated, and most plays.
  ///
  /// [id] - Trakt ID, Trakt slug, or IMDB ID
  /// [sortBy] - how to sort
  /// 📄 Pagination 😁 Emojis
  Future<List<Comment>> getMovieComments(String id,
      {CommentsSortBy sortBy = CommentsSortBy.newest,
      RequestPagination? pagination}) async {
    return await _getList<Comment>("movies/$id/comments/${sortBy.value}",
        pagination: pagination);
  }

  /// Returns all lists that contain this movie.
  ///
  /// By default, personal lists are returned sorted by the most popular.
  ///
  /// [id] - Trakt ID, Trakt slug, or IMDB ID
  /// [type] - Filter for a specific list type
  /// [sortBy] - How to sort
  ///
  /// 📄 Pagination 😁 Emojis
  Future<List<TraktList>> getMovieLists(String id,
      {ListType type = ListType.personal,
      ListSort sortBy = ListSort.popular,
      RequestPagination? pagination}) async {
    return await _getList<TraktList>(
        "movies/$id/lists/${type.value}/${sortBy.value}",
        pagination: pagination);
  }

  /// Returns all cast and crew for a movie.
  ///
  /// Each cast member will have a characters array and a standard person object.
  /// The crew object will be broken up into production, art, crew, costume & make-up, directing, writing,
  /// sound, camera, visual effects, lighting, and editing (if there are people for those crew positions).
  /// Each of those members will have a jobs array and a standard person object.
  ///
  /// [id] - Trakt ID, Trakt slug, or IMDB ID
  ///
  /// ✨ Extended Info
  Future<MoviePeople> getMoviePeople(String id,
      {bool extendedFull = false}) async {
    return await _get<MoviePeople>("movies/$id/people",
        extendedFull: extendedFull);
  }

  /// Returns rating (between 0 and 10) and distribution for a movie.
  ///
  /// [id] - Trakt ID, Trakt slug, or IMDB ID
  Future<Rating> getMovieRatings(String id) async {
    return await _get<Rating>("movies/$id/ratings");
  }

  /// Returns related and similar movies.
  ///
  /// [id] - Trakt ID, Trakt slug, or IMDB ID
  ///
  /// 📄 Pagination ✨ Extended Info
  Future<List<Movie>> getRelatedMovie(String id,
      {bool extendedFull = false, RequestPagination? pagination}) async {
    return await _getList<Movie>("movies/$id/related",
        extendedFull: extendedFull, pagination: pagination);
  }

  /// Returns lots of movie stats.
  ///
  /// [id] - Trakt ID, Trakt slug, or IMDB ID
  Future<MovieStats> getMovieStats(String id) async {
    return await _get<MovieStats>("movies/$id/stats");
  }

  /// Returns all users watching this movie right now.
  ///
  /// [id] - Trakt ID, Trakt slug, or IMDB ID
  ///
  /// ✨ Extended Info
  Future<List<User>> getMovieWatchers(String id,
      {bool extendedFull = false}) async {
    return await _getList<User>("movies/$id/watching",
        extendedFull: extendedFull);
  }
}
