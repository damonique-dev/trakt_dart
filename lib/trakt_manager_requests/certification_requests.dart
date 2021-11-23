part of trakt_dart;

extension CertificationRequests on TraktManager {
  /// Get a list of all certifications, including names, slugs, and descriptions.
  ///
  /// [certType] - Possible values:  movies , shows
  Future<CertificationsResult> getCertifications(
      CertificationType certType) async {
    return await _get<CertificationsResult>("certifications/${certType.value}");
  }
}
