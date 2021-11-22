part of trakt_dart;

@JsonSerializable(createToJson: false)
class Network {
  final String name;

  Network(this.name);

  factory Network.fromJson(Map<String, dynamic> json) =>
      _$NetworkFromJson(json);

  static Network fromJsonModel(Map<String, dynamic> json) =>
      Network.fromJson(json);
}
