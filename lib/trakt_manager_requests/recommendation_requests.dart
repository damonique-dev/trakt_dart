part of trakt_dart;

/// Trakt social recommendations use all the Recommendations lists from the users you follow.
/// The more users you follow with similar tastes, the better your recommendations will be.
/// We also use other factors for the algorithm to further personalize what gets recommended.
class Recommendations extends Category {
  Recommendations(TraktManager manager) : super(manager);

  /// Movie recommendations for a user.
  ///
  /// By default, 10 results are returned. You can send a limit to get up to 100 results per page.
  /// Set [ignoreCollected]=true to filter out movies the user has already collected.
  ///
  /// [ignoreCollected] -filter out collected movies
  ///
  /// 🔒 OAuth Required ✨ Extended Info
  Future<List<Movie>> getMovieRecommendations(
      {bool? ignoreCollected, bool extendedFull = false}) async {
    return await _manager._authenticatedGetList<Movie>("recommendations/movies",
        extendedFull: extendedFull,
        queryParamameters: (ignoreCollected ?? false)
            ? {"ignore_collected": ignoreCollected!}
            : null);
  }

  /// Hide a movie from getting recommended anymore.
  ///
  /// [id] - Trakt ID, Trakt slug, or IMDB ID
  ///
  /// 🔒 OAuth Required
  Future<void> hideMovieRecommendation(String id) async {
    return await _manager._authenticatedDelete("recommendations/movies/$id");
  }

  /// TV show recommendations for a user.
  ///
  /// By default, 10 results are returned. You can send a limit to get up to 100 results per page.
  /// Set [ignoreCollected]=true to filter out shows the user has already collected.
  ///
  /// [ignoreCollected] -filter out collected movies
  ///
  /// 🔒 OAuth Required ✨ Extended Info
  Future<List<Show>> getShowRecommendations(
      {bool? ignoreCollected, bool extendedFull = false}) async {
    return await _manager._authenticatedGetList<Show>("recommendations/shows",
        extendedFull: extendedFull,
        queryParamameters: (ignoreCollected ?? false)
            ? {"ignore_collected": ignoreCollected!}
            : null);
  }

  /// Hide a show from getting recommended anymore.
  ///
  /// [id] - Trakt ID, Trakt slug, or IMDB ID
  ///
  /// 🔒 OAuth Required
  Future<void> hideShowRecommendation(String id) async {
    return await _manager._authenticatedDelete("recommendations/shows/$id");
  }
}
