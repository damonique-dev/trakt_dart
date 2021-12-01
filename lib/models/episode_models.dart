part of trakt_dart;

@JsonSerializable()
class Episode {
  // Extended: metadata (minimum data provided)
  final int season;
  final int number;
  final String? title;
  final Ids ids;

  // Extended: full
  final String? overview;
  final double? rating;
  final int? votes, runtime;

  @JsonKey(name: 'comment_count')
  final int? commentCount;

  @JsonKey(name: 'first_aired')
  final String? firstAired;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @JsonKey(name: 'available_translations')
  final List<String>? availableTranslations;

  Episode(
      this.season,
      this.number,
      this.title,
      this.ids,
      this.overview,
      this.rating,
      this.votes,
      this.runtime,
      this.commentCount,
      this.firstAired,
      this.updatedAt,
      this.availableTranslations);

  factory Episode.fromJson(Map<String, dynamic> json) =>
      _$EpisodeFromJson(json);
  Map<String, dynamic> toJson() => _$EpisodeToJson(this);

  static Episode fromJsonModel(Map<String, dynamic> json) =>
      Episode.fromJson(json);

  Map<String, dynamic> get metadata => {"ids": ids};
}

@JsonSerializable(createToJson: false)
class EpisodeStats {
  final int watchers, plays, collectors, comments, lists, votes;

  EpisodeStats(this.watchers, this.plays, this.collectors, this.comments,
      this.lists, this.votes);

  factory EpisodeStats.fromJson(Map<String, dynamic> json) =>
      _$EpisodeStatsFromJson(json);

  static EpisodeStats fromJsonModel(Map<String, dynamic> json) =>
      EpisodeStats.fromJson(json);
}

@JsonSerializable(createToJson: false)
class CollectedEpisode {
  final int number;
  final Metadata? metadata;

  @JsonKey(name: 'collected_at')
  final String collectedAt;

  CollectedEpisode(this.number, this.collectedAt, this.metadata);

  factory CollectedEpisode.fromJson(Map<String, dynamic> json) =>
      _$CollectedEpisodeFromJson(json);

  static CollectedEpisode fromJsonModel(Map<String, dynamic> json) =>
      CollectedEpisode.fromJson(json);
}

@JsonSerializable(createToJson: false)
class WatchedEpisode {
  final int number, plays;

  @JsonKey(name: 'last_watched_at')
  final String lastWatchedAt;

  WatchedEpisode(this.number, this.plays, this.lastWatchedAt);

  factory WatchedEpisode.fromJson(Map<String, dynamic> json) =>
      _$WatchedEpisodeFromJson(json);

  static WatchedEpisode fromJsonModel(Map<String, dynamic> json) =>
      WatchedEpisode.fromJson(json);
}
