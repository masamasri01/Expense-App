import 'dart:convert';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class BarChartModel {
  String day;
  int expenditure;
  charts.Color color =
      charts.ColorUtil.fromDartColor(Color.fromRGBO(60, 234, 155, 1));

  BarChartModel({
    required this.day,
    required this.expenditure,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'day': day,
      'expenditure': expenditure,
    };
  }

  factory BarChartModel.fromMap(Map<String, dynamic> map) {
    return BarChartModel(
      day: map['day'] as String,
      expenditure: map['expenditure'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory BarChartModel.fromJson(String source) =>
      BarChartModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
