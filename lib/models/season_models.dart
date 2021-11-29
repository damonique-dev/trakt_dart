part of trakt_dart;

@JsonSerializable(createToJson: false)
class Season {
  // Extended: metadata (minimum data provided)
  final int number;
  final Ids ids;

  // Extended: full
  final String? title, overview, network;
  final double? rating;
  final int? votes;

  @JsonKey(name: 'episode_count')
  final int? episodeCount;

  @JsonKey(name: 'aired_episodes')
  final int? airedEpisodes;

  @JsonKey(name: 'first_aired')
  final String? firstAired;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  Season(
      this.number,
      this.ids,
      this.title,
      this.overview,
      this.network,
      this.rating,
      this.votes,
      this.episodeCount,
      this.airedEpisodes,
      this.firstAired,
      this.updatedAt);

  factory Season.fromJson(Map<String, dynamic> json) => _$SeasonFromJson(json);

  static Season fromJsonModel(Map<String, dynamic> json) =>
      Season.fromJson(json);

  Map<String, dynamic> get metadata => {"ids": ids};
}

@JsonSerializable(createToJson: false)
class SeasonStats {
  final int watchers, plays, collectors, comments, lists, votes;
  @JsonKey(name: 'collected_episodes')
  final int collectedEpisodes;

  SeasonStats(this.watchers, this.plays, this.collectors, this.comments,
      this.lists, this.votes, this.collectedEpisodes);

  factory SeasonStats.fromJson(Map<String, dynamic> json) =>
      _$SeasonStatsFromJson(json);

  static SeasonStats fromJsonModel(Map<String, dynamic> json) =>
      SeasonStats.fromJson(json);
}
