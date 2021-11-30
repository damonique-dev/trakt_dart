part of trakt_dart;

/// Base class of [Category]
abstract class Category {
  /// Instance of [TMDB]
  final TraktManager _manager;

  Category(this._manager);
}
