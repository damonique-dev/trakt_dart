part of trakt_dart;

@JsonSerializable()
class CheckInSharing {
  final bool twitter, tumblr;

  CheckInSharing({required this.twitter, required this.tumblr});

  factory CheckInSharing.fromJson(Map<String, dynamic> json) =>
      _$CheckInSharingFromJson(json);
  Map<String, dynamic> toJson() => _$CheckInSharingToJson(this);

  static CheckInSharing fromJsonModel(Map<String, dynamic> json) =>
      CheckInSharing.fromJson(json);
}

@JsonSerializable(createToJson: false)
class CheckInResponse {
  final int id;
  @JsonKey(name: 'watched_at')
  final String watchedAt;
  final CheckInSharing sharing;
  final Movie? movie;
  final Episode? episode;
  final Show? show;

  CheckInResponse(this.id, this.watchedAt, this.sharing, this.movie,
      this.episode, this.show);

  factory CheckInResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckInResponseFromJson(json);

  static CheckInResponse fromJsonModel(Map<String, dynamic> json) =>
      CheckInResponse.fromJson(json);
}
