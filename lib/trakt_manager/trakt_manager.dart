import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:trakt_dart/extensions.dart';
import 'package:trakt_dart/models/common_models.dart';
import 'package:trakt_dart/models/movie_models.dart';
import 'package:trakt_dart/models/users_models.dart';
import 'package:trakt_dart/trakt_manager/request_models.dart';

part 'movie_requests.dart';

class TraktManager {
  String? _clientId;
  String? _clientSecret;
  String _baseURL = "api.trakt.tv";
  Map<String, String> _headers = {};

  static final TraktManager instance = TraktManager._internal();

  TraktManager._internal();

  factory TraktManager() {
    return instance;
  }

  void initializeTraktMananager({required String clientId, required String clientSecret,  bool useStaging = false}) {
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

  Future<T> _get<T>(String request, {bool extendedFull = false, RequestPagination? pagination}) async {
    assert(_clientId != null && _clientSecret != null, "Call initializeTraktMananager before making any requests");
    
    final queryParams = <String, String>{};
    queryParams.addAll(pagination?.toMap() ?? {});
    
    if (extendedFull) {
      queryParams["extended"] = "full";
    }

    final url  = Uri.https(_baseURL, request, queryParams);
    final response = await http.get(url, headers: _headers);

    // TODO: Parse Response Code
    log('Response status: ${response.statusCode}');

    final jsonResult = jsonDecode(response.body);
    return (T).jsonDecoder(jsonResult);
  }

  Future<List<T>> _getList<T>(String request, {bool extendedFull = false, RequestPagination? pagination, Filters? filters}) async {
    assert(_clientId != null && _clientSecret != null, "Call initializeTraktMananager before making any requests");
    
    final queryParams = <String, String>{};
    
    queryParams.addAll(pagination?.toMap() ?? {});
    queryParams.addAll(filters?.toMap() ?? {});
    
    if (extendedFull) {
      queryParams["extended"] = "full";
    }

    final url  = Uri.https(_baseURL, request, queryParams);
    final response = await http.get(url, headers: _headers);

    // TODO: Parse Response Code
    log('Response status: ${response.statusCode}');

    final jsonResult = jsonDecode(response.body);

    if (jsonResult is Iterable) {
      return jsonResult.map((json) => (T).jsonDecoder(json) as T).toList();
    }
    return [];
  }
}
