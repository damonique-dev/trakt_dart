part of trakt_dart;

@JsonSerializable(createToJson: false)
class Show {
  // Extended: metadata (minimum data provided)
  final String title;
  final int? year;
  final Ids ids;

  // Extended: full
  final String? overview,
      certification,
      network,
      country,
      trailer,
      homepage,
      status,
      language;
  final int? runtime, votes;
  final AirTime? airs;
  final double? rating;
  final List<String>? genres;

  @JsonKey(name: 'first_aired')
  final String? firstAired;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @JsonKey(name: 'comment_count')
  final int? commentCount;

  @JsonKey(name: 'available_translations')
  final List<String>? availableTranslations;

  @JsonKey(name: 'aired_episodes')
  final int? airedEpisodes;

  Show(
      this.title,
      this.year,
      this.ids,
      this.overview,
      this.certification,
      this.network,
      this.country,
      this.trailer,
      this.homepage,
      this.status,
      this.updatedAt,
      this.language,
      this.runtime,
      this.votes,
      this.airs,
      this.rating,
      this.genres,
      this.firstAired,
      this.commentCount,
      this.availableTranslations,
      this.airedEpisodes);

  factory Show.fromJson(Map<String, dynamic> json) => _$ShowFromJson(json);

  static Show fromJsonModel(Map<String, dynamic> json) => Show.fromJson(json);

  Map<String, dynamic> get metadata =>
      {"title": title, "year": year, "ids": ids};
}

@JsonSerializable(createToJson: false)
class AirTime {
  final String? day, time, timezone;

  AirTime(this.day, this.time, this.timezone);

  factory AirTime.fromJson(Map<String, dynamic> json) =>
      _$AirTimeFromJson(json);

  static AirTime fromJsonModel(Map<String, dynamic> json) =>
      AirTime.fromJson(json);
}

@JsonSerializable(createToJson: false)
class TrendingShow {
  final int watchers;
  final Show show;

  TrendingShow(this.watchers, this.show);

  factory TrendingShow.fromJson(Map<String, dynamic> json) =>
      _$TrendingShowFromJson(json);

  static TrendingShow fromJsonModel(Map<String, dynamic> json) =>
      TrendingShow.fromJson(json);
}

@JsonSerializable(createToJson: false)
class RecommendedShow {
  @JsonKey(name: 'user_count')
  final int userCount;
  final Show show;

  RecommendedShow(this.userCount, this.show);

  factory RecommendedShow.fromJson(Map<String, dynamic> json) =>
      _$RecommendedShowFromJson(json);

  static RecommendedShow fromJsonModel(Map<String, dynamic> json) =>
      RecommendedShow.fromJson(json);
}

@JsonSerializable(createToJson: false)
class PlayedWatchedCollectedShow {
  @JsonKey(name: 'watcher_count')
  final int watcherCount;
  @JsonKey(name: 'play_count')
  final int playCount;
  @JsonKey(name: 'collected_count')
  final int collectedCount;
  final Show show;

  PlayedWatchedCollectedShow(
      this.watcherCount, this.playCount, this.collectedCount, this.show);

  factory PlayedWatchedCollectedShow.fromJson(Map<String, dynamic> json) =>
      _$PlayedWatchedCollectedShowFromJson(json);

  static PlayedWatchedCollectedShow fromJsonModel(Map<String, dynamic> json) =>
      PlayedWatchedCollectedShow.fromJson(json);
}

@JsonSerializable(createToJson: false)
class AnticipatedShow {
  @JsonKey(name: 'list_count')
  final int listCount;
  final Show show;

  AnticipatedShow(this.listCount, this.show);

  factory AnticipatedShow.fromJson(Map<String, dynamic> json) =>
      _$AnticipatedShowFromJson(json);

  static AnticipatedShow fromJsonModel(Map<String, dynamic> json) =>
      AnticipatedShow.fromJson(json);
}

@JsonSerializable(createToJson: false)
class UpdatedShow {
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  final Show show;

  UpdatedShow(this.updatedAt, this.show);

  factory UpdatedShow.fromJson(Map<String, dynamic> json) =>
      _$UpdatedShowFromJson(json);

  static UpdatedShow fromJsonModel(Map<String, dynamic> json) =>
      UpdatedShow.fromJson(json);
}

@JsonSerializable(createToJson: false)
class ShowCertification {
  final String certification, country;

  ShowCertification(this.certification, this.country);

  factory ShowCertification.fromJson(Map<String, dynamic> json) =>
      _$ShowCertificationFromJson(json);

  static ShowCertification fromJsonModel(Map<String, dynamic> json) =>
      ShowCertification.fromJson(json);
}

@JsonSerializable(createToJson: false)
class ShowTranslation {
  final String? title, overview, language;

  ShowTranslation(this.title, this.overview, this.language);

  factory ShowTranslation.fromJson(Map<String, dynamic> json) =>
      _$ShowTranslationFromJson(json);

  static ShowTranslation fromJsonModel(Map<String, dynamic> json) =>
      ShowTranslation.fromJson(json);
}

@JsonSerializable(createToJson: false)
class ShowStats {
  final int watchers, plays, collectors, comments, lists, votes, recommended;
  @JsonKey(name: 'collected_episodes')
  final int collectedEpisodes;

  ShowStats(this.watchers, this.plays, this.collectors, this.comments,
      this.lists, this.votes, this.recommended, this.collectedEpisodes);

  factory ShowStats.fromJson(Map<String, dynamic> json) =>
      _$ShowStatsFromJson(json);

  static ShowStats fromJsonModel(Map<String, dynamic> json) =>
      ShowStats.fromJson(json);
}

@JsonSerializable(createToJson: false)
class ShowCollectionProgress {
  final int aired, completed;
  final List<ShowSeasonProgress> seasons;

  @JsonKey(name: 'last_collected_at')
  final String lastCollectedAt;

  @JsonKey(name: 'hidden_seasons')
  final List<Season>? hiddenSeasons;

  @JsonKey(name: 'next_episode')
  final Episode? nextEpisode;

  @JsonKey(name: 'last_episode')
  final Episode? lastEpisode;

  ShowCollectionProgress(
      this.aired,
      this.completed,
      this.seasons,
      this.lastCollectedAt,
      this.hiddenSeasons,
      this.nextEpisode,
      this.lastEpisode);

  factory ShowCollectionProgress.fromJson(Map<String, dynamic> json) =>
      _$ShowCollectionProgressFromJson(json);

  static ShowCollectionProgress fromJsonModel(Map<String, dynamic> json) =>
      ShowCollectionProgress.fromJson(json);
}

@JsonSerializable(createToJson: false)
class ShowWatchedProgress {
  final int aired, completed;
  final List<ShowSeasonProgress> seasons;

  @JsonKey(name: 'reset_at')
  final String? resetAt;

  @JsonKey(name: 'last_watched_at')
  final String lastWatchedAt;

  @JsonKey(name: 'hidden_seasons')
  final List<Season>? hiddenSeasons;

  @JsonKey(name: 'next_episode')
  final Episode? nextEpisode;

  @JsonKey(name: 'last_episode')
  final Episode? lastEpisode;

  ShowWatchedProgress(
      this.aired,
      this.completed,
      this.seasons,
      this.lastWatchedAt,
      this.hiddenSeasons,
      this.nextEpisode,
      this.lastEpisode,
      this.resetAt);

  factory ShowWatchedProgress.fromJson(Map<String, dynamic> json) =>
      _$ShowWatchedProgressFromJson(json);

  static ShowWatchedProgress fromJsonModel(Map<String, dynamic> json) =>
      ShowWatchedProgress.fromJson(json);
}

@JsonSerializable(createToJson: false)
class ShowSeasonProgress {
  final int number, aired, completed;
  final String title;
  final List<ShowEpisodeProgress> episodes;

  ShowSeasonProgress(
      this.number, this.aired, this.completed, this.title, this.episodes);

  factory ShowSeasonProgress.fromJson(Map<String, dynamic> json) =>
      _$ShowSeasonProgressFromJson(json);

  static ShowSeasonProgress fromJsonModel(Map<String, dynamic> json) =>
      ShowSeasonProgress.fromJson(json);
}

@JsonSerializable(createToJson: false)
class ShowEpisodeProgress {
  final int number;
  final bool completed;

  @JsonKey(name: 'collected_at')
  final String? collectedAt;

  ShowEpisodeProgress(this.number, this.completed, this.collectedAt);

  factory ShowEpisodeProgress.fromJson(Map<String, dynamic> json) =>
      _$ShowEpisodeProgressFromJson(json);

  static ShowEpisodeProgress fromJsonModel(Map<String, dynamic> json) =>
      ShowEpisodeProgress.fromJson(json);
}

@JsonSerializable(createToJson: false)
class ShowProgressReset {
  @JsonKey(name: 'reset_at')
  final String resetAt;

  ShowProgressReset(this.resetAt);

  factory ShowProgressReset.fromJson(Map<String, dynamic> json) =>
      _$ShowProgressResetFromJson(json);

  static ShowProgressReset fromJsonModel(Map<String, dynamic> json) =>
      ShowProgressReset.fromJson(json);
}
