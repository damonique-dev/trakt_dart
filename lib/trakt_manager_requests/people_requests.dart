part of trakt_dart;

class People extends Category {
  People(TraktManager manager) : super(manager);

  /// Returns a single person's details.
  ///
  /// [id] - Trakt ID, Trakt slug, or IMDB ID
  ///
  /// ✨ Extended Info
  Future<Person> getPersonSummary(String id,
      {bool extendedFull = false}) async {
    return await _manager._get("people/$id", extendedFull: extendedFull);
  }

  /// Returns all movies where this person is in the cast or crew.
  ///
  /// Each cast object will have a characters array and a standard movie object.
  /// The crew object will be broken up into production, art, crew, costume & make-up, directing, writing,
  /// sound, camera, visual effects, lighting, and editing (if there are people for those crew positions).
  /// Each of those members will have a jobs array and a standard movie object.
  ///
  /// [id] - Trakt ID, Trakt slug, or IMDB ID
  ///
  /// ✨ Extended Info
  Future<PersonMovieCredits> getPersonMovieCredits(String id,
      {bool extendedFull = false}) async {
    return await _manager._get("people/$id/movies", extendedFull: extendedFull);
  }

  /// Returns all shows where this person is in the cast or crew, including the episode_count for which they appear.
  ///
  /// Each cast object will have a characters array and a standard show object.
  /// If series_regular is true, this person is a series regular and not simply a guest star.
  /// The crew object will be broken up into production, art, crew, costume & make-up, directing, writing, sound,
  /// camera, visual effects, lighting, editing, and created by (if there are people for those crew positions).
  /// Each of those members will have a jobs array and a standard show object.
  ///
  /// [id] - Trakt ID, Trakt slug, or IMDB ID
  ///
  /// ✨ Extended Info
  Future<PersonShowCredits> getPersonShowCredits(String id,
      {bool extendedFull = false}) async {
    return await _manager._get("people/$id/shows", extendedFull: extendedFull);
  }

  /// Returns all lists that contain this person.
  ///
  /// By default, personal lists are returned sorted by the most popular.
  ///
  /// [id] - Trakt ID, Trakt slug, or IMDB ID
  /// [type] - Filter for a specific list type
  /// [sortBy] - How to sort
  ///
  /// 📄 Pagination 😁 Emojis
  Future<List<TraktList>> getPersonLists(String id,
      {ListType type = ListType.personal,
      ListSort sortBy = ListSort.popular,
      RequestPagination? pagination}) async {
    return await _manager._getList<TraktList>(
        "people/$id/lists/${type.value}/${sortBy.value}",
        pagination: pagination);
  }
}
