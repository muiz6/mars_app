class InsightUrl {
  String apiKey;

  static const String _MAIN_URL = 'https://api.nasa.gov/insight_weather/';

  InsightUrl({String apiKey = 'DEMO_KEY'}) : apiKey = apiKey;

  String toString() {
    return '$_MAIN_URL?api_key=$apiKey&feedtype=json&ver=1.0';
  }
}
