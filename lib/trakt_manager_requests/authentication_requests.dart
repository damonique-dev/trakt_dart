part of trakt_dart;

extension AuthenticationRequests on TraktManager {
  /// Construct then redirect to this URL.
  ///
  /// The Trakt website will request permissions for your app, which the user needs to approve.
  /// If the user isn't signed into Trakt, it will ask them to do so.
  /// Send signup=true if you prefer the account sign up page to be the default.
  Future<void> authorizeApplication({bool? signup}) async {
    final url = Uri.parse(_oauthURL);
    final response =
        await client.get(url, headers: {"Content-Type": "application/json"});

    if (![200, 201, 204].contains(response.statusCode)) {
      throw TraktManagerAPIError(
          response.statusCode, response.reasonPhrase, response);
    }
  }

  /// Use the authorization code GET parameter sent back to your redirect_uri to get an access_token.
  ///
  /// Save the access_token so your app can authenticate the user by sending the Authorization header.
  ///
  /// The access_token is valid for 3 months.
  /// Save and use the refresh_token to get a new access_token without asking the user to re-authenticate.
  Future<AccessTokenResponse> getAccessToken(String code) async {
    return _oauthToken({"code": code});
  }

  /// Use the refresh_token to get a new access_token without asking the user to re-authenticate.
  ///
  /// The access_token is valid for 3 months before it needs to be refreshed again.
  Future<AccessTokenResponse> refreshAccessToken({String? refreshToken}) async {
    if (refreshToken != null) {
      _refreshToken = refreshToken;
    }

    if (_refreshToken == null) {
      throw Exception("Refresh token is null");
    }

    return _oauthToken({"refresh_token": _refreshToken!});
  }

  /// An access_token can be revoked when a user signs out of their Trakt account in your app.
  ///
  /// This is not required, but might improve the user experience so the user doesn't have an unused app connection hanging around.
  Future<void> revokeAccessToken() async {
    final url = Uri.https(_baseURL, "oauth/token");
    final body = {
      "token": _accessToken,
      "client_id": _clientId!,
      "client_secret": _clientSecret!,
    };
    final response = await client.post(url,
        headers: {"Content-Type": "application/json"}, body: body);

    if (![200, 201, 204].contains(response.statusCode)) {
      throw TraktManagerAPIError(
          response.statusCode, response.reasonPhrase, response);
    }

    _accessToken = null;
    _refreshToken = null;

    return;
  }

  Future<AccessTokenResponse> _oauthToken(Map<String, String> body) async {
    final url = Uri.https(_baseURL, "oauth/token");
    body.addAll({
      "client_id": _clientId!,
      "client_secret": _clientSecret!,
      "redirect_uri": _redirectURI!,
      "grant_type": "authorization_code"
    });
    final response = await client.post(url,
        headers: {"Content-Type": "application/json"}, body: body);

    if (![200, 201, 204].contains(response.statusCode)) {
      throw TraktManagerAPIError(
          response.statusCode, response.reasonPhrase, response);
    }

    final jsonResult = jsonDecode(response.body);
    final accessTokenResponse = AccessTokenResponse.fromJsonModel(jsonResult);

    _accessToken = accessTokenResponse.accessToken;
    _refreshToken = accessTokenResponse.refreshToken;

    return accessTokenResponse;
  }
}
