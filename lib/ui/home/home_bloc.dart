import 'package:flutter/material.dart';
import 'package:mars_app/bloc.dart';
import 'package:mars_app/ui/home/explore/explore_page.dart';
import 'package:mars_app/ui/home/weather/weather_page.dart';
import 'package:mars_app/ui/home/weather/weather_bloc.dart';

class HomeBloc extends Bloc {
  var _factories = [
    _WeatherFactory(),
    _ExploreFactory(),
  ];

  @override
  void dispose() {
    (_factories[0] as _WeatherFactory)._viewModel.dispose();
  }

  Widget getContent(int index) {
    return _factories[index].create();
  }
}

abstract class _WidgetFactory {
  Widget create();
}

class _WeatherFactory extends _WidgetFactory {
  final WeatherBloc _viewModel = WeatherBloc();

  @override
  Widget create() {
    return WeatherPage(_viewModel);
  }
}

class _ExploreFactory extends _WidgetFactory {
  @override
  Widget create() {
    return ExplorePage();
  }
}