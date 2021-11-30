part of trakt_dart;

class Certifications extends Category {
  Certifications(TraktManager manager) : super(manager);

  /// Get a list of all certifications, including names, slugs, and descriptions.
  ///
  /// [certType] - Possible values:  movies , shows
  Future<CertificationsResult> getCertifications(
      CertificationType certType) async {
    return await _manager
        ._get<CertificationsResult>("certifications/${certType.value}");
  }
}
