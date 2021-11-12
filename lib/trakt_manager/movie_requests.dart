part of 'trakt_manager.dart';

extension MovieRequests on TraktManager {
  Future<List<TrendingMovie>> getTrendingMovies({bool extendedFull = false, RequestPagination? pagination, MovieFilters? filters}) async {
    return await _getList("movies/trending", extendedFull: extendedFull, pagination: pagination, filters: filters);
  }

  Future<List<RecommendedMovie>> getPopularMovies(TimePeriod period, {bool extendedFull = false, RequestPagination? pagination, MovieFilters? filters}) async {
    return await _getList("movies/popular", extendedFull: extendedFull, pagination: pagination, filters: filters);
  }

  Future<List<RecommendedMovie>> getRecommendedMovies(TimePeriod period, {bool extendedFull = false, RequestPagination? pagination, MovieFilters? filters}) async {
    return await _getList("movies/recommended/${period.toString()}", extendedFull: extendedFull, pagination: pagination, filters: filters);
  }

  Future<List<PlayedWatchedCollectedMovie>> getMostPlayedMovies(TimePeriod period, {bool extendedFull = false, RequestPagination? pagination, MovieFilters? filters}) async {
    return await _getList("movies/played/${period.toString()}", extendedFull: extendedFull, pagination: pagination, filters: filters);
  }

  Future<List<PlayedWatchedCollectedMovie>> getMostWatchedMovies(TimePeriod period, {bool extendedFull = false, RequestPagination? pagination, MovieFilters? filters}) async {
    return await _getList("movies/watched/${period.toString()}", extendedFull: extendedFull, pagination: pagination, filters: filters);
  }

  Future<List<PlayedWatchedCollectedMovie>> getMostCollectedMovies(TimePeriod period, {bool extendedFull = false, RequestPagination? pagination, MovieFilters? filters}) async {
    return await _getList("movies/collected/${period.toString()}", extendedFull: extendedFull, pagination: pagination, filters: filters);
  }

  Future<List<PlayedWatchedCollectedMovie>> getMostAnticipatedMovies({bool extendedFull = false, RequestPagination? pagination, MovieFilters? filters}) async {
    return await _getList("movies/anticipated", extendedFull: extendedFull, pagination: pagination, filters: filters);
  }

  Future<List<BoxOfficeMovie>> getBoxOfficeMovies({bool extendedFull = false}) async {
    return await _getList("movies/boxoffice", extendedFull: extendedFull);
  }

  Future<List<UpdatedMovie>> getUpdatedMovies(String startDate, {bool extendedFull = false, RequestPagination? pagination}) async {
    return await _getList("movies/updates/startDate", extendedFull: extendedFull, pagination: pagination);
  }

  Future<List<int>> getUpdatedMovieIds(String startDate, RequestPagination? pagination) async {
    return await _getList("movies/updates/id/startDate", pagination: pagination);
  }

  Future<Movie> getMovieSummary(String id, {bool extendedFull = false}) async {
    return await _get<Movie>("movies/$id", extendedFull: extendedFull);
  }

  Future<List<MovieAlias>> getMovieAliases(String id) async {
    return await _getList<MovieAlias>("movies/$id/aliases");
  }

  Future<List<MovieRelease>> getMovieReleases(String id, String country) async {
    return await _getList<MovieRelease>("movies/$id/releases/$country");
  }

  Future<List<MovieTranslation>> getMovieTranslations(String id, String language) async {
    return await _getList<MovieTranslation>("movies/$id/translations/$language");
  }

  Future<List<Comment>> getMovieComments(String id, CommentsSortBy sortBy, {RequestPagination? pagination}) async {
    return await _getList<Comment>("movies/$id/comments/${sortBy.toString()}", pagination: pagination);
  }

  Future<List<TraktList>> getMovieLists(String id, ListType type, ListSort sortBy, {RequestPagination? pagination}) async {
    return await _getList<TraktList>("movies/$id/lists/${type.toString()}/${sortBy.toString()}", pagination: pagination);
  }

  Future<MoviePeople> getMoviePeople(String id, {bool extendedFull = false}) async {
    return await _get<MoviePeople>("movies/$id/people", extendedFull: extendedFull);
  }

  Future<Rating> getMovieRatings(String id) async {
    return await _get<Rating>("movies/$id/ratings");
  }

  Future<List<Movie>> getRelatedMovie(String id, {bool extendedFull = false, RequestPagination? pagination}) async {
    return await _getList<Movie>("movies/$id/related", extendedFull: extendedFull, pagination: pagination);
  }

  Future<Stats> getMovieStats(String id) async {
    return await _get<Stats>("movies/$id/stats");
  }

  Future<List<User>> getMovieWatchers(String id, {bool extendedFull = false}) async {
    return await _getList<User>("movies/$id/watching", extendedFull: extendedFull);
  }
}