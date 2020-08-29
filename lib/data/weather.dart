import 'package:mars_app/data/sol.dart';

class Weather {
  final List<int> solKeys = List();
  final Map<int, Sol> mapSols = Map();

  Weather.fromJson(Map<String, dynamic> json) {
    for (final String solKey in json['sol_keys']) {
      solKeys.add(int.parse(solKey));
    }

    for (final int solKey in solKeys) {
      final Sol sol = new Sol(solKey, json);
      mapSols[solKey] = sol;
    }
  }
}