part of trakt_dart;

@JsonSerializable(createToJson: false)
class Episode {
  // Extended: metadata (minimum data provided)
  final int season;
  final int number;
  final String title;
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

  static Episode fromJsonModel(Map<String, dynamic> json) =>
      Episode.fromJson(json);
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
