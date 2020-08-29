import 'dart:convert';

import 'package:http/http.dart';
import 'package:mars_app/data/insight_url.dart';
import 'package:mars_app/data/weather.dart';
import 'package:http/http.dart' as http;

// singleton
class Repository {
  static final Repository _INSTANCE = Repository._();
  static final String _URL = InsightUrl().toString();

  Repository._();

  static Repository getInstance() => _INSTANCE;

  Future<Weather> getWeather() async {
    final Response response = await http.get(_URL);
    return Weather.fromJson(json.decode(response.body));
  }
}
