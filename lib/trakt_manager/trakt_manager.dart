import 'dart:convert';

import 'package:http/http.dart' show Client, Response;
import 'package:trakt_dart/extensions.dart';
import 'package:trakt_dart/models/common_models.dart';
import 'package:trakt_dart/models/episode_models.dart';
import 'package:trakt_dart/models/movie_models.dart';
import 'package:trakt_dart/models/people_models.dart';
import 'package:trakt_dart/models/season_models.dart';
import 'package:trakt_dart/models/show_models.dart';
import 'package:trakt_dart/models/users_models.dart';
import 'package:trakt_dart/trakt_manager/request_models.dart';

part 'episode_requests.dart';
part 'movie_requests.dart';
part 'people_requests.dart';
part 'season_requests.dart';
part 'show_requests.dart';

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
      {bool extendedFull = false, RequestPagination? pagination}) async {
    assert(_clientId != null && _clientSecret != null,
        "Call initializeTraktMananager before making any requests");

    final queryParams = <String, String>{};
    queryParams.addAll(pagination?.toMap() ?? {});

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
    return (T).jsonDecoder(jsonResult);
  }

  Future<List<T>> _getList<T>(String request,
      {bool extendedFull = false,
      RequestPagination? pagination,
      Filters? filters}) async {
    assert(_clientId != null && _clientSecret != null,
        "Call initializeTraktMananager before making any requests");

    final queryParams = <String, String>{};

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
