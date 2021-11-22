part of trakt_dart;

enum CountryType { movie, show }

extension CountryTypeValue on CountryType {
  String get value {
    switch (this) {
      case CountryType.movie:
        return "movie";
      case CountryType.show:
        return "show";
    }
  }
}

@JsonSerializable(createToJson: false)
class Country {
  final String name, code;

  Country(this.name, this.code);

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  static Country fromJsonModel(Map<String, dynamic> json) =>
      Country.fromJson(json);
}
