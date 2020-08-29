import 'package:flutter/material.dart';

class RowValues extends StatelessWidget {
  final List<double> _valueList;

  RowValues(List<double> valueList) : _valueList = valueList {
    if (valueList.length != 7) {
      throw Exception('Size of valueList must be 7!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(_valueList[0].toInt().toString()),
        Text(_valueList[1].toInt().toString()),
        Text(_valueList[2].toInt().toString()),
        Text(_valueList[3].toInt().toString()),
        Text(_valueList[4].toInt().toString()),
        Text(_valueList[5].toInt().toString()),
        Text(_valueList[6].toInt().toString()),
      ],
    );
  }
}
