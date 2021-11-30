part of trakt_dart;

class Calendar extends Category {
  Calendar(TraktManager manager) : super(manager);

  /// Returns all shows airing during the time period specified.
  ///
  /// [startDate] - Start the calendar on this date.
  /// [numberOfDays] - Number of days to display
  ///
  /// 🔒 OAuth Required ✨ Extended Info 🎚 Filters
  Future<List<MyCalendarShow>> getMyCalendarShows(
      {String? startDate,
      int? numberOfDays,
      bool extendedFull = false,
      Filters? filters}) async {
    assert(
        (startDate == null && numberOfDays == null) ||
            (startDate != null && numberOfDays != null),
        "Both startdate and numberOfDays need to be given or both be null");

    var request = "";
    if (startDate != null) {
      request = "/$startDate/$numberOfDays";
    }
    return await _manager._authenticatedGetList<MyCalendarShow>(
        "calendars/my/shows$request",
        extendedFull: extendedFull,
        filters: filters);
  }

  /// Returns all new show premieres (season 1, episode 1) airing during the time period specified.
  ///
  /// [startDate] - Start the calendar on this date.
  /// [numberOfDays] - Number of days to display
  ///
  /// 🔒 OAuth Required ✨ Extended Info 🎚 Filters
  Future<List<MyCalendarShow>> getMyNewShows(
      {String? startDate,
      int? numberOfDays,
      bool extendedFull = false,
      Filters? filters}) async {
    assert(
        (startDate == null && numberOfDays == null) ||
            (startDate != null && numberOfDays != null),
        "Both startdate and numberOfDays need to be given or both be null");

    var request = "";
    if (startDate != null) {
      request = "/$startDate/$numberOfDays";
    }
    return await _manager._authenticatedGetList<MyCalendarShow>(
        "calendars/my/shows/new$request",
        extendedFull: extendedFull,
        filters: filters);
  }

  /// Returns all show premieres (any season, episode 1) airing during the time period specified.
  ///
  /// [startDate] - Start the calendar on this date.
  /// [numberOfDays] - Number of days to display
  ///
  /// 🔒 OAuth Required ✨ Extended Info 🎚 Filters
  Future<List<MyCalendarShow>> getMySeasonPremieres(
      {String? startDate,
      int? numberOfDays,
      bool extendedFull = false,
      Filters? filters}) async {
    assert(
        (startDate == null && numberOfDays == null) ||
            (startDate != null && numberOfDays != null),
        "Both startdate and numberOfDays need to be given or both be null");

    var request = "";
    if (startDate != null) {
      request = "/$startDate/$numberOfDays";
    }
    return await _manager._authenticatedGetList<MyCalendarShow>(
        "calendars/my/shows/premieres$request",
        extendedFull: extendedFull,
        filters: filters);
  }

  /// Returns all movies with a release date during the time period specified.
  ///
  /// [startDate] - Start the calendar on this date.
  /// [numberOfDays] - Number of days to display
  ///
  /// 🔒 OAuth Required ✨ Extended Info 🎚 Filters
  Future<List<MyCalendarMovie>> getMyCalendarMovies(
      {String? startDate,
      int? numberOfDays,
      bool extendedFull = false,
      Filters? filters}) async {
    assert(
        (startDate == null && numberOfDays == null) ||
            (startDate != null && numberOfDays != null),
        "Both startdate and numberOfDays need to be given or both be null");

    var request = "";
    if (startDate != null) {
      request = "/$startDate/$numberOfDays";
    }
    return await _manager._authenticatedGetList<MyCalendarMovie>(
        "calendars/my/movies$request",
        extendedFull: extendedFull,
        filters: filters);
  }

  /// Returns all movies with a DVD release date during the time period specified.
  ///
  /// [startDate] - Start the calendar on this date.
  /// [numberOfDays] - Number of days to display
  ///
  /// 🔒 OAuth Required ✨ Extended Info 🎚 Filters
  Future<List<MyCalendarMovie>> getMyDvdReleases(
      {String? startDate,
      int? numberOfDays,
      bool extendedFull = false,
      Filters? filters}) async {
    assert(
        (startDate == null && numberOfDays == null) ||
            (startDate != null && numberOfDays != null),
        "Both startdate and numberOfDays need to be given or both be null");

    var request = "";
    if (startDate != null) {
      request = "/$startDate/$numberOfDays";
    }

    return await _manager._authenticatedGetList<MyCalendarMovie>(
        "calendars/my/dvd$request",
        extendedFull: extendedFull,
        filters: filters);
  }

  /// Returns all shows airing during the time period specified.
  ///
  /// [startDate] - Start the calendar on this date.
  /// [numberOfDays] - Number of days to display
  ///
  /// ✨ Extended Info 🎚 Filters
  Future<List<MyCalendarShow>> getCalendarAllShows(
      {String? startDate,
      int? numberOfDays,
      bool extendedFull = false,
      Filters? filters}) async {
    assert(
        (startDate == null && numberOfDays == null) ||
            (startDate != null && numberOfDays != null),
        "Both startdate and numberOfDays need to be given or both be null");

    var request = "";
    if (startDate != null) {
      request = "/$startDate/$numberOfDays";
    }

    return await _manager._getList<MyCalendarShow>(
        "calendars/all/shows$request",
        extendedFull: extendedFull,
        filters: filters);
  }

  /// Returns all new show premieres (season 1, episode 1) airing during the time period specified.
  ///
  /// [startDate] - Start the calendar on this date.
  /// [numberOfDays] - Number of days to display
  ///
  /// ✨ Extended Info 🎚 Filters
  Future<List<MyCalendarShow>> getCalendarAllNewShows(
      {String? startDate,
      int? numberOfDays,
      bool extendedFull = false,
      Filters? filters}) async {
    assert(
        (startDate == null && numberOfDays == null) ||
            (startDate != null && numberOfDays != null),
        "Both startdate and numberOfDays need to be given or both be null");

    var request = "";
    if (startDate != null) {
      request = "/$startDate/$numberOfDays";
    }

    return await _manager._getList<MyCalendarShow>(
        "calendars/all/shows/new$request",
        extendedFull: extendedFull,
        filters: filters);
  }

  /// Returns all show premieres (any season, episode 1) airing during the time period specified.
  ///
  /// [startDate] - Start the calendar on this date.
  /// [numberOfDays] - Number of days to display
  ///
  /// ✨ Extended Info 🎚 Filters
  Future<List<MyCalendarShow>> getCalendarAllSeasonPremieres(
      {String? startDate,
      int? numberOfDays,
      bool extendedFull = false,
      Filters? filters}) async {
    assert(
        (startDate == null && numberOfDays == null) ||
            (startDate != null && numberOfDays != null),
        "Both startdate and numberOfDays need to be given or both be null");

    var request = "";
    if (startDate != null) {
      request = "/$startDate/$numberOfDays";
    }

    return await _manager._getList<MyCalendarShow>(
        "calendars/all/shows/premieres$request",
        extendedFull: extendedFull,
        filters: filters);
  }

  /// Returns all movies with a release date during the time period specified.
  ///
  /// [startDate] - Start the calendar on this date.
  /// [numberOfDays] - Number of days to display
  ///
  /// ✨ Extended Info 🎚 Filters
  Future<List<MyCalendarMovie>> getCalendarAllMovies(
      {String? startDate,
      int? numberOfDays,
      bool extendedFull = false,
      Filters? filters}) async {
    assert(
        (startDate == null && numberOfDays == null) ||
            (startDate != null && numberOfDays != null),
        "Both startdate and numberOfDays need to be given or both be null");

    var request = "";
    if (startDate != null) {
      request = "/$startDate/$numberOfDays";
    }
    return await _manager._getList<MyCalendarMovie>(
        "calendars/all/movies$request",
        extendedFull: extendedFull,
        filters: filters);
  }

  /// Returns all movies with a DVD release date during the time period specified.
  ///
  /// [startDate] - Start the calendar on this date.
  /// [numberOfDays] - Number of days to display
  ///
  /// ✨ Extended Info 🎚 Filters
  Future<List<MyCalendarMovie>> getCalendarAllDvdReleases(
      {String? startDate,
      int? numberOfDays,
      bool extendedFull = false,
      Filters? filters}) async {
    assert(
        (startDate == null && numberOfDays == null) ||
            (startDate != null && numberOfDays != null),
        "Both startdate and numberOfDays need to be given or both be null");

    var request = "";
    if (startDate != null) {
      request = "/$startDate/$numberOfDays";
    }
    return await _manager._getList<MyCalendarMovie>("calendars/all/dvd$request",
        extendedFull: extendedFull, filters: filters);
  }
}
