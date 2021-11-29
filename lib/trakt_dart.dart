library trakt_dart;

import 'dart:convert';

import 'package:http/http.dart' show Client, Response;
import 'package:json_annotation/json_annotation.dart';

part 'models/authentication_models.dart';
part 'models/calendar_models.dart';
part 'models/certification_models.dart';
part 'models/check_in_models.dart';
part 'models/comment_models.dart';
part 'models/common_models.dart';
part 'models/countries_models.dart';
part 'models/episode_models.dart';
part 'models/extensions.dart';
part 'models/genre_models.dart';
part 'models/language_models.dart';
part 'models/list_models.dart';
part 'models/movie_models.dart';
part 'models/network_models.dart';
part 'models/people_models.dart';
part 'models/scrobble_models.dart';
part 'models/search_models.dart';
part 'models/season_models.dart';
part 'models/show_models.dart';
part 'models/users_models.dart';
part 'models/request_models.dart';
part 'trakt_manager_requests/authentication_requests.dart';
part 'trakt_manager_requests/calendar_requests.dart';
part 'trakt_manager_requests/certification_requests.dart';
part 'trakt_manager_requests/check_in_requests.dart';
part 'trakt_manager_requests/comment_requests.dart';
part 'trakt_manager_requests/countries_requests.dart';
part 'trakt_manager_requests/episode_requests.dart';
part 'trakt_manager_requests/genre_requests.dart';
part 'trakt_manager_requests/language_requests.dart';
part 'trakt_manager_requests/list_requests.dart';
part 'trakt_manager_requests/movie_requests.dart';
part 'trakt_manager_requests/network_requests.dart';
part 'trakt_manager_requests/people_requests.dart';
part 'trakt_manager_requests/recommendation_requests.dart';
part 'trakt_manager_requests/scrobble_requests.dart';
part 'trakt_manager_requests/search_requests.dart';
part 'trakt_manager_requests/season_requests.dart';
part 'trakt_manager_requests/show_requests.dart';

part 'trakt_dart.g.dart';

class TraktManager {
  String? _clientId;
  String? _clientSecret;
  String? _redirectURI;
  String _baseURL = "api.trakt.tv";
  late String _oauthURL;
  String? _accessToken;
  String? _refreshToken;
  Map<String, String> _headers = {};

  Client client;
  static final TraktManager instance = TraktManager._internal(Client());

  TraktManager._internal(this.client);

  factory TraktManager() {
    return instance;
  }

  /// Initializes the TraktManager for making API calls. This must be called before making any API calls!
  ///
  /// [clientId] - The ClientId listed under your Trakt applications
  /// [clientSecret] - The Client secret listed under your Trakt applications
  /// [redirectURI] - the redirect uri set under your Trakt applications for OAuth.
  /// [useStaging] - whether to use the Trakt Staging environment. Default to false.
  void initializeTraktMananager(
      {required String clientId,
      required String clientSecret,
      required String redirectURI,
      bool useStaging = false}) {
    _clientId = clientId;
    _clientSecret = clientSecret;
    _redirectURI = redirectURI;

    _headers = {
      "trakt-api-version": "2",
      "trakt-api-key": clientId,
      "Content-type": "application/json"
    };

    if (useStaging) {
      _baseURL = "api-staging.trakt.tv";
    }

    _oauthURL =
        "https://trakt.tv/oauth/authorize?response_type=code&client_id=$_clientId&redirect_uri=$_redirectURI";
  }

  Future<T> _get<T>(String request,
      {bool extendedFull = false,
      bool includeGuestStars = false,
      RequestPagination? pagination,
      Map<String, String>? queryParamameters}) async {
    assert(_clientId != null && _clientSecret != null,
        "Call initializeTraktMananager before making any requests");

    final queryParams = queryParamameters ?? {};
    queryParams.addAll(pagination?.toMap() ?? {});

    List<String> extendedParams = [];
    if (extendedFull) {
      extendedParams.add("full");
    }
    if (includeGuestStars) {
      extendedParams.add("guest_stars");
    }
    if (extendedParams.isNotEmpty) {
      queryParams["extended"] = extendedParams.join(",");
    }

    final url = Uri.https(_baseURL, request, queryParams);
    final response = await client.get(url, headers: _headers);

    if (![200, 201, 204].contains(response.statusCode)) {
      throw TraktManagerAPIError(
          response.statusCode, response.reasonPhrase, response);
    }

    final jsonResult = jsonDecode(response.body);
    return (T).jsonDecoder(jsonResult);
  }

  Future<T> _authenticatedGet<T>(String request,
      {Map<String, String>? queryParamameters}) async {
    assert(_clientId != null && _clientSecret != null,
        "Call initializeTraktMananager before making any requests");
    assert(_accessToken != null,
        "Autheticate app and get access token before making authenticated request.");

    final queryParams = queryParamameters ?? {};
    final headers = _headers;
    headers["Authorization"] = "Bearer ${_accessToken!}";

    final url = Uri.https(_baseURL, request, queryParams);
    final response = await client.get(url, headers: _headers);

    if (![200, 201, 204].contains(response.statusCode)) {
      throw TraktManagerAPIError(
          response.statusCode, response.reasonPhrase, response);
    }

    final jsonResult = jsonDecode(response.body);
    return (T).jsonDecoder(jsonResult);
  }

  Future<List<T>> _getList<T>(String request,
      {bool extendedFull = false,
      RequestPagination? pagination,
      Filters? filters,
      Map<String, dynamic>? queryParamameters}) async {
    assert(_clientId != null && _clientSecret != null,
        "Call initializeTraktMananager before making any requests");

    final queryParams = queryParamameters ?? {};

    queryParams.addAll(pagination?.toMap() ?? {});
    queryParams.addAll(filters?.toMap() ?? {});

    if (extendedFull) {
      queryParams["extended"] = "full";
    }

    final url = Uri.https(_baseURL, request, queryParams);
    final response = await client.get(url, headers: _headers);

    if (![200, 201, 204].contains(response.statusCode)) {
      throw TraktManagerAPIError(
          response.statusCode, response.reasonPhrase, response);
    }

    final jsonResult = jsonDecode(response.body);

    if (jsonResult is Iterable) {
      return jsonResult.map((json) => (T).jsonDecoder(json) as T).toList();
    }
    return [];
  }

  Future<List<T>> _authenticatedGetList<T>(String request,
      {bool extendedFull = false,
      RequestPagination? pagination,
      Filters? filters,
      Map<String, dynamic>? queryParamameters}) async {
    assert(_clientId != null && _clientSecret != null,
        "Call initializeTraktMananager before making any requests");

    final queryParams = queryParamameters ?? {};

    queryParams.addAll(pagination?.toMap() ?? {});
    queryParams.addAll(filters?.toMap() ?? {});

    if (extendedFull) {
      queryParams["extended"] = "full";
    }

    final headers = _headers;
    headers["Authorization"] = "Bearer ${_accessToken!}";

    final url = Uri.https(_baseURL, request, queryParams);
    final response = await client.get(url, headers: _headers);

    if (![200, 201, 204].contains(response.statusCode)) {
      throw TraktManagerAPIError(
          response.statusCode, response.reasonPhrase, response);
    }

    final jsonResult = jsonDecode(response.body);

    if (jsonResult is Iterable) {
      return jsonResult.map((json) => (T).jsonDecoder(json) as T).toList();
    }
    return [];
  }

  Future<List<int>> _getIds<T>(String request,
      {RequestPagination? pagination}) async {
    assert(_clientId != null && _clientSecret != null,
        "Call initializeTraktMananager before making any requests");

    final queryParams = <String, String>{};

    queryParams.addAll(pagination?.toMap() ?? {});

    final url = Uri.https(_baseURL, request, queryParams);
    final response = await client.get(url, headers: _headers);

    if (![200, 201, 204].contains(response.statusCode)) {
      throw TraktManagerAPIError(
          response.statusCode, response.reasonPhrase, response);
    }

    final jsonResult = jsonDecode(response.body);
    if (jsonResult is Iterable) {
      return jsonResult.toList().cast<int>();
    }
    return [];
  }

  Future<T> _authenticatedPost<T>(String request, {String? body}) async {
    assert(_clientId != null && _clientSecret != null,
        "Call initializeTraktMananager before making any requests");
    assert(_accessToken != null,
        "Autheticate app and get access token before making authenticated request.");

    final headers = _headers;
    headers["Authorization"] = "Bearer ${_accessToken!}";

    final url = Uri.https(_baseURL, request);
    final response = await client.post(url, headers: _headers, body: body);

    if (![200, 201, 204].contains(response.statusCode)) {
      throw TraktManagerAPIError(
          response.statusCode, response.reasonPhrase, response);
    }

    final jsonResult = jsonDecode(response.body);
    return (T).jsonDecoder(jsonResult);
  }

  Future<T> _authenticatedPut<T>(String request, {String? body}) async {
    assert(_clientId != null && _clientSecret != null,
        "Call initializeTraktMananager before making any requests");
    assert(_accessToken != null,
        "Autheticate app and get access token before making authenticated request.");

    final headers = _headers;
    headers["Authorization"] = "Bearer ${_accessToken!}";

    final url = Uri.https(_baseURL, request);
    final response = await client.put(url, headers: _headers, body: body);

    if (![200, 201, 204].contains(response.statusCode)) {
      throw TraktManagerAPIError(
          response.statusCode, response.reasonPhrase, response);
    }

    final jsonResult = jsonDecode(response.body);
    return (T).jsonDecoder(jsonResult);
  }

  Future<void> _authenticatedDelete(String request) async {
    assert(_clientId != null && _clientSecret != null,
        "Call initializeTraktMananager before making any requests");
    assert(_accessToken != null,
        "Autheticate app and get access token before making authenticated request.");

    final headers = _headers;
    headers["Authorization"] = "Bearer ${_accessToken!}";

    final url = Uri.https(_baseURL, request);
    final response = await client.delete(url, headers: _headers);

    if (![200, 201, 204].contains(response.statusCode)) {
      throw TraktManagerAPIError(
          response.statusCode, response.reasonPhrase, response);
    }
    return;
  }
}

class TraktManagerAPIError {
  final int statusCode;
  final String? reasonPhrase;
  final Response response;

  TraktManagerAPIError(this.statusCode, this.reasonPhrase, this.response);
}
