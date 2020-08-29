import 'dart:async';

import 'package:charts_flutter/flutter.dart';
import 'package:mars_app/bloc.dart';
import 'package:mars_app/data/repository.dart';
import 'package:mars_app/data/sol.dart';
import 'package:mars_app/data/weather.dart';
import 'package:mars_app/strings.dart';
import 'package:tuple/tuple.dart';

class WeatherBloc extends Bloc {
  final String area = Strings.ELYSIUM_PLANITIA_MARS;

  final Repository _repository;
  final StreamController<List<Sol>> _streamController = StreamController.broadcast();
  Weather _weather;

  WeatherBloc() : _repository = Repository.getInstance() {
    _refresh(_repository);
    _streamController.onListen = () {
      if (_weather != null) {
        _streamController.add(_weather.mapSols.values.toList());
      }
    };
  }

  @override
  void dispose() {
    _streamController.close();
  }

  void onRefreshAction() {
    _refresh(_repository);
  }

  Stream<List<Sol>> getDataStream() {
    return _streamController.stream;
  }

  List<double> getMaxTempList() {
    final List<double> listMaxTemp = List();
    if (_weather != null) {
      final List<Sol> listSols = _weather.mapSols.values.toList();

      // in case list size is greater than 7
      for (int i= 0; i < 7 && i < listSols.length; i++) {
        listMaxTemp.add(listSols[i].maxTemperature);
      }
    }

    // fill up to seven spaces no matter what
    for (int i = listMaxTemp.length; i < 7; i++) {
      listMaxTemp.add(0);
    }
    return listMaxTemp;
  }

  List<double> getMinTempList() {
    final List<double> listMinTemp = List();
    if (_weather != null) {
      final List<Sol> listSols = _weather.mapSols.values.toList();

      // in case list size is greater than 7
      for (int i= 0; i < 7 && i < listSols.length; i++) {
        listMinTemp.add(listSols[i].minTemperature);
      }
    }

    // fill up to seven spaces no matter what
    for (int i = listMinTemp.length; i < 7; i++) {
      listMinTemp.add(0);
    }
    return listMinTemp;
  }

  List<Series<Tuple2, int>> getLineChartData() {
    final List<double> yList = List();
    if (_weather != null) {
      List<Sol> solList = _weather.mapSols.values.toList();
      for (final Sol sol in solList) {
        yList.add(sol.avgTemperature);
      }
    }
    for (int i = yList.length; i < 7; i++) {
      yList.add(0);
    }
    final List<Tuple2<int, double>> data = new List();
    for (int i = 0; i < yList.length; i++) {
      data.add(Tuple2(i, yList[i]));
    }
    return [
      Series(id: 'Temperature',
          data: data,
          domainFn: (Tuple2 a, b) => a.item1,
          measureFn: (Tuple2 a, b) => a.item2,
      ),
    ];
  }

  void _refresh(Repository repository) {
    _repository.getWeather().then((weather) {
      _weather = weather;
      _streamController.add(weather.mapSols.values.toList());
    });
  }
}
