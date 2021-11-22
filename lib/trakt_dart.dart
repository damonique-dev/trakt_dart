library trakt_dart;

import 'dart:convert';

import 'package:http/http.dart' show Client, Response;
import 'package:json_annotation/json_annotation.dart';

part 'models/certification_models.dart';
part 'models/common_models.dart';
part 'models/countries_models.dart';
part 'models/episode_models.dart';
part 'models/extensions.dart';
part 'models/genre_models.dart';
part 'models/movie_models.dart';
part 'models/people_models.dart';
part 'models/search_models.dart';
part 'models/season_models.dart';
part 'models/show_models.dart';
part 'models/users_models.dart';
part 'models/request_models.dart';
part 'trakt_manager_requests/certification_requests.dart';
part 'trakt_manager_requests/countries_requests.dart';
part 'trakt_manager_requests/episode_requests.dart';
part 'trakt_manager_requests/genre_requests.dart';
part 'trakt_manager_requests/movie_requests.dart';
part 'trakt_manager_requests/people_requests.dart';
part 'trakt_manager_requests/search_requests.dart';
part 'trakt_manager_requests/season_requests.dart';
part 'trakt_manager_requests/show_requests.dart';

part 'trakt_dart.g.dart';

class TraktManager {
  String? _clientId;
  String? _clientSecret;
  String _baseURL = "api.trakt.tv";
  Map<String, String> _headers = {};

  Client client;
  static final TraktManager instance = TraktManager._internal(Client());

  TraktManager._internal(this.client);

  factory TraktManager() {
    return instance;
  }

  void initializeTraktMananager(
      {required String clientId,
      required String clientSecret,
      bool useStaging = false}) {
    _clientId = clientId;
    _clientSecret = clientSecret;

    _headers = {
      "trakt-api-version": "2",
      "trakt-api-key": clientId,
      "Content-type": "application/json"
    };

    if (useStaging) {
      _baseURL = "api-staging.trakt.tv";
    }
  }

  Future<T> _get<T>(String request,
      {bool extendedFull = false,
      bool includeGuestStars = false,
      RequestPagination? pagination}) async {
    assert(_clientId != null && _clientSecret != null,
        "Call initializeTraktMananager before making any requests");

    final queryParams = <String, String>{};
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

  Future<List<T>> _getList<T>(String request,
      {bool extendedFull = false,
      RequestPagination? pagination,
      Filters? filters,
      Map<String, String>? queryParamameters}) async {
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
}

class TraktManagerAPIError {
  final int statusCode;
  final String? reasonPhrase;
  final Response response;

  TraktManagerAPIError(this.statusCode, this.reasonPhrase, this.response);
}
