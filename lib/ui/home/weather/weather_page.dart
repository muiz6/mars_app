import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mars_app/assets.dart';
import 'package:mars_app/data/sol.dart';
import 'package:mars_app/strings.dart';
import 'package:mars_app/ui/dimensions.dart';
import 'package:mars_app/ui/home/weather/row_values.dart';
import 'package:mars_app/ui/home/weather/weather_bloc.dart';
import 'package:mars_app/ui/styles.dart';
import 'package:charts_flutter/flutter.dart';

class WeatherPage extends StatefulWidget {
  final WeatherBloc _viewModel;

  WeatherPage(WeatherBloc viewModel) : _viewModel = viewModel;

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StreamBuilder(
        initialData: [Sol.empty()],
        stream: widget._viewModel.getDataStream(),
        builder: (context, list) {
          final List<Sol> listSol = list.data;
          return Column(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on),
                        Text(
                          widget._viewModel.area,
                          style: Styles.TEXT_STYLE_H2,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          listSol.last.avgTemperature.toInt().toString(),
                          style: Styles.TEXT_STYLE_MEGA,
                        ),
                        Text(
                          '°c',
                          style: Styles.TEXT_STYLE_MEGA,
                        ),
                      ],
                    ),
                    Text(
                      listSol.last.season,
                      style: Styles.TEXT_STYLE_H1,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.IMG_INSIGHT_WEATHER),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_M),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(Strings.PRESSURE),
                          Row(
                            children: [
                              Icon(Icons.grain),
                              Text(listSol.last.pressure.toString()),
                              Text(Strings.PA),
                            ],
                          ),
                        ],
                      ),
                      Text('|'),
                      Column(
                        children: [
                          Text(Strings.WIND),
                          Row(
                            children: [
                              Icon(Icons.toys),
                              Text(listSol.last.windSpeed.toString()),
                              Text(Strings.MPS),
                              Text(listSol.last.windDirection)
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                margin: EdgeInsets.all(Dimensions.MARGIN_M),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_M),
                  child: Column(
                    children: [
                      RowValues(widget._viewModel.getMaxTempList()),
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: LineChart(
                          widget._viewModel.getLineChartData(),
                          animate: true,
                          defaultRenderer: LineRendererConfig(
                            includePoints: true,
                          ),
                        ),
                      ),
                      RowValues(widget._viewModel.getMinTempList()),
                    ],
                  ),
                ),
                margin: EdgeInsets.all(Dimensions.MARGIN_M),
              ),
              FlatButton.icon(
                  onPressed: () {
                    setState(() {
                      widget._viewModel.onRefreshAction();
                    });
                  },
                  icon: Icon(Icons.refresh),
                  label: Text(Strings.REFRESH)),
            ],
          );
        },
      ),
    );
  }
}
