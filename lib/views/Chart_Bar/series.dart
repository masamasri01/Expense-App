import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_charts/flutter_charts.dart';

Widget chartToRun() {
  LabelLayoutStrategy? xContainerLabelLayoutStrategy;
  ChartData chartData;
  ChartOptions chartOptions = const ChartOptions();
  // Example with side effects cannot be simply pasted to your code, as the _ExampleSideEffects is private
  // This example shows the result with sufficient space to show all labels
  chartData = ChartData(
    dataRows: const [
      [200.0, 190.0, 180.0, 200.0, 250.0, 300.0],
      [0, 0.0, 0.0, 0.0, 0.0, 0.0],
    ],
    xUserLabels: const ['January', 'February', 'March', 'April', 'May', 'June'],
    dataRowsLegends: const [
      'Owl count',
      'Hawk count',
    ],
    chartOptions: chartOptions,
  );
  // exampleSideEffects = _ExampleSideEffects()..leftSqueezeText=''.. rightSqueezeText='';
  var verticalBarChartContainer = VerticalBarChartTopContainer(
    chartData: chartData,
    xContainerLabelLayoutStrategy: xContainerLabelLayoutStrategy,
  );

  var verticalBarChart = VerticalBarChart(
    painter: VerticalBarChartPainter(
      verticalBarChartContainer: verticalBarChartContainer,
    ),
    child: Container(
      child: Text('dcfv'),
      height: 20,
      margin: EdgeInsets.only(top: 500),
    ),
  )

      //   Container(height: 200, color: Colors.orange),
      ;
  return Container(
    child: verticalBarChart,
    // margin: EdgeInsets.only(bottom: 200),
  );
}
