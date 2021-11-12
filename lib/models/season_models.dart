import 'package:json_annotation/json_annotation.dart';
import 'package:trakt_dart/models/common_models.dart';

part 'season_models.g.dart';

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

  Season(this.number, this.ids, this.title, this.overview, this.network, this.rating, this.votes, this.episodeCount, this.airedEpisodes, this.firstAired, this.updatedAt);

  factory Season.fromJson(Map<String, dynamic> json) => _$SeasonFromJson(json);

  static Season fromJsonModel(Map<String, dynamic> json) => Season.fromJson(json);
}
