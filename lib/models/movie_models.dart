part of trakt_dart;

@JsonSerializable()
class Movie {
  // Extended: metadata (minimum data provided)
  final String title;
  final int? year;
  final Ids ids;

  // Extended: full
  final String? overview,
      country,
      language,
      certification,
      tagline,
      trailer,
      homepage,
      status,
      released,
      updatedAt;
  final int? runtime, votes;
  final double? rating;
  @JsonKey(name: 'available_translations')
  final List<String>? availableTranslations;
  final List<String>? genres;
  @JsonKey(name: 'comment_count')
  final int? commentCount;

  Movie(
      this.title,
      this.overview,
      this.country,
      this.language,
      this.certification,
      this.year,
      this.runtime,
      this.votes,
      this.commentCount,
      this.ids,
      this.tagline,
      this.trailer,
      this.homepage,
      this.status,
      this.rating,
      this.availableTranslations,
      this.genres,
      this.released,
      this.updatedAt);

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);

  static Movie fromJsonModel(Map<String, dynamic> json) => Movie.fromJson(json);
}

@JsonSerializable(createToJson: false)
class TrendingMovie {
  final int watchers;
  final Movie movie;

  TrendingMovie(this.watchers, this.movie);

  factory TrendingMovie.fromJson(Map<String, dynamic> json) =>
      _$TrendingMovieFromJson(json);

  static TrendingMovie fromJsonModel(Map<String, dynamic> json) =>
      TrendingMovie.fromJson(json);
}

@JsonSerializable(createToJson: false)
class RecommendedMovie {
  @JsonKey(name: 'user_count')
  final int userCount;
  final Movie movie;

  RecommendedMovie(this.userCount, this.movie);

  factory RecommendedMovie.fromJson(Map<String, dynamic> json) =>
      _$RecommendedMovieFromJson(json);

  static RecommendedMovie fromJsonModel(Map<String, dynamic> json) =>
      RecommendedMovie.fromJson(json);
}

@JsonSerializable(createToJson: false)
class PlayedWatchedCollectedMovie {
  @JsonKey(name: 'watcher_count')
  final int watcherCount;
  @JsonKey(name: 'play_count')
  final int playCount;
  @JsonKey(name: 'collected_count')
  final int collectedCount;
  final Movie movie;

  PlayedWatchedCollectedMovie(
      this.watcherCount, this.playCount, this.collectedCount, this.movie);

  factory PlayedWatchedCollectedMovie.fromJson(Map<String, dynamic> json) =>
      _$PlayedWatchedCollectedMovieFromJson(json);

  static PlayedWatchedCollectedMovie fromJsonModel(Map<String, dynamic> json) =>
      PlayedWatchedCollectedMovie.fromJson(json);
}

@JsonSerializable(createToJson: false)
class AnticipatedMovie {
  @JsonKey(name: 'list_count')
  final int listCount;
  final Movie movie;

  AnticipatedMovie(this.listCount, this.movie);

  factory AnticipatedMovie.fromJson(Map<String, dynamic> json) =>
      _$AnticipatedMovieFromJson(json);

  static AnticipatedMovie fromJsonModel(Map<String, dynamic> json) =>
      AnticipatedMovie.fromJson(json);
}

@JsonSerializable(createToJson: false)
class BoxOfficeMovie {
  final int revenue;
  final Movie movie;

  BoxOfficeMovie(this.revenue, this.movie);

  factory BoxOfficeMovie.fromJson(Map<String, dynamic> json) =>
      _$BoxOfficeMovieFromJson(json);

  static BoxOfficeMovie fromJsonModel(Map<String, dynamic> json) =>
      BoxOfficeMovie.fromJson(json);
}

@JsonSerializable(createToJson: false)
class UpdatedMovie {
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  final Movie movie;

  UpdatedMovie(this.updatedAt, this.movie);

  factory UpdatedMovie.fromJson(Map<String, dynamic> json) =>
      _$UpdatedMovieFromJson(json);

  static UpdatedMovie fromJsonModel(Map<String, dynamic> json) =>
      UpdatedMovie.fromJson(json);
}

@JsonSerializable(createToJson: false)
class MovieRelease {
  final String? country, certification, note;
  @JsonKey(name: 'release_date')
  final String? releaseDate;
  @JsonKey(name: 'release_type')
  final String? releaseType;

  MovieRelease(this.country, this.certification, this.releaseDate,
      this.releaseType, this.note);

  factory MovieRelease.fromJson(Map<String, dynamic> json) =>
      _$MovieReleaseFromJson(json);

  static MovieRelease fromJsonModel(Map<String, dynamic> json) =>
      MovieRelease.fromJson(json);
}

@JsonSerializable(createToJson: false)
class MovieTranslation {
  final String title, overview, tagline, language;

  MovieTranslation(this.title, this.overview, this.tagline, this.language);

  factory MovieTranslation.fromJson(Map<String, dynamic> json) =>
      _$MovieTranslationFromJson(json);

  static MovieTranslation fromJsonModel(Map<String, dynamic> json) =>
      MovieTranslation.fromJson(json);
}

@JsonSerializable(createToJson: false)
class MovieStats {
  final int watchers, plays, collectors, comments, lists, votes, recommended;

  MovieStats(this.watchers, this.plays, this.collectors, this.comments,
      this.lists, this.votes, this.recommended);

  factory MovieStats.fromJson(Map<String, dynamic> json) =>
      _$MovieStatsFromJson(json);

  static MovieStats fromJsonModel(Map<String, dynamic> json) =>
      MovieStats.fromJson(json);
}
