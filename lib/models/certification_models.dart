part of trakt_dart;

enum CertificationType { movie, show }

extension CertificationTypeValue on CertificationType {
  String get value {
    switch (this) {
      case CertificationType.movie:
        return "movie";
      case CertificationType.show:
        return "show";
    }
  }
}

@JsonSerializable(createToJson: false)
class CertificationsResult {
  @JsonKey(name: 'us')
  final List<Certification> certifications;

  CertificationsResult(this.certifications);

  factory CertificationsResult.fromJson(Map<String, dynamic> json) =>
      _$CertificationsResultFromJson(json);

  static CertificationsResult fromJsonModel(Map<String, dynamic> json) =>
      CertificationsResult.fromJson(json);
}

@JsonSerializable(createToJson: false)
class Certification {
  final String name, slug, description;

  Certification(this.name, this.slug, this.description);

  factory Certification.fromJson(Map<String, dynamic> json) =>
      _$CertificationFromJson(json);

  static Certification fromJsonModel(Map<String, dynamic> json) =>
      Certification.fromJson(json);
}
