part of trakt_dart;

/// Most TV shows and movies have a certification to indicate the content rating.
/// Some API methods allow filtering by certification, so it's good to cache this list in your app.
///
/// Note: Only us certifications are currently returned.
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
