import 'package:flutter/foundation.dart';
import 'package:newsapp/DataLayer/News.dart';
import 'dart:async';
import 'dart:convert' show json;

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:newsapp/DataLayer/Sources.dart';

class NewsApiClient {
  final apiKey = "YOUR-API-KEY-HERE";
  final host = "newsapi.org";
  final version = "v2";

  Future<List<Sources>> fetchSources() async {
    final results = await request(path: 'sources', parameters: {});

    final response = results['sources'];
    return response
        .map<Sources>((json) => Sources.fromJson(json))
        .toList(growable: false);
  }

  Future<List<News>> fetchNewsByCategory(String query, String category) async {
    final results = await request(
        path: 'top-headlines',
        parameters: {'q': query, 'country': 'ng', 'category': category});

    final response = results['location_suggestions'];
    return response
        .map<News>((json) => News.fromJson(json))
        .toList(growable: false);
  }

  Future<List<News>> fetchNewsBySources(String query, String sources) async {
    final results = await request(
        path: 'top-headlines',
        parameters: {'q': query, 'country': 'ng', 'sources': sources});

    final response = results['articles'];
    return response
        .map<News>((json) => News.fromJson(json))
        .toList(growable: false);
  }

  Future<Map> request(
      {@required String path, Map<String, String> parameters}) async {
    parameters["apiKey"] = apiKey;
    final uri = Uri.http(host, '$version/$path', parameters);
    final results = await http.get(uri, headers: _headers);
    final jsonObject = json.decode(results.body);
    return jsonObject;
  }

  Map<String, String> get _headers =>
      {'Accept': 'application/json', 'Authorization': apiKey};
}
