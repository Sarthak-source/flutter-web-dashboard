import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarCustomization extends StatelessWidget {
  const BarCustomization({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 0),
        axisLine: const AxisLine(width: 0),
      ),
      primaryYAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 0),
        axisLine: const AxisLine(width: 0),
      ),
      series: <CartesianSeries<ChartSampleData, String>>[
        BarSeries<ChartSampleData, String>(
          dataLabelSettings: const DataLabelSettings(isVisible: true),
          dataSource: <ChartSampleData>[
            ChartSampleData(x: 'China', y: 30, pointColor: Colors.redAccent),
            ChartSampleData(x: 'India', y: 50, pointColor: Colors.indigo),
            ChartSampleData(x: 'United States', y: 70, pointColor: Colors.grey),
            ChartSampleData(x: 'Indonesia', y: 82, pointColor: Colors.orange),
            ChartSampleData(x: 'Pakistan', y: 80, pointColor: Colors.green),
            ChartSampleData(x: 'Brazil', y: 90, pointColor: Colors.blue),
            ChartSampleData(x: 'Nigeria', y: 100, pointColor: Colors.yellow),
            ChartSampleData(x: 'Bangladesh', y: 166, pointColor: Colors.purple),
            ChartSampleData(x: 'Russia', y: 146, pointColor: Colors.cyan),
            ChartSampleData(x: 'Mexico', y: 130, pointColor: Colors.teal),
          ],
          xValueMapper: (ChartSampleData sales, _) => sales.x,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          color: Colors.teal
        )
      ],
      tooltipBehavior:
          TooltipBehavior(enable: true, canShowMarker: false, header: ''),
    );
  }
}

class ChartSampleData {
  final String x;
  final double y;
  final Color? pointColor;

  ChartSampleData({required this.x, required this.y, this.pointColor});
}
