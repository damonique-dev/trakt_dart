part of trakt_dart;

extension CertificationRequests on TraktManager {
  Future<CertificationsResult> getCertifications(
      CertificationType certType) async {
    return await _get<CertificationsResult>("certifications/${certType.value}");
  }
}
