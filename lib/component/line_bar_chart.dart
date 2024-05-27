import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:web_dashboard_example/models/chart_model.dart';

class LineBarChart extends StatefulWidget {
  const LineBarChart({super.key});

  @override
  State<LineBarChart> createState() => _LineBarChartState();
}

class _LineBarChartState extends State<LineBarChart> {
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 0),
        axisLine: const AxisLine(width: 0),
      ),
      legend: const Legend(isVisible: false),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <ChartSeries>[
        ColumnSeries<ChartData, String>(
          dataSource: getChartData(),
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y1,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          name: 'Sales',
          color: Colors.teal.withOpacity(0.8), // Set the color for ColumnSeries
          dataLabelSettings: const DataLabelSettings(isVisible: true),
        ),
        SplineAreaSeries<ChartData, String>(
          dataSource: getChartData(),
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y2,
          name: 'Revenue',
          color: Colors.indigo
              .withOpacity(0.5), // Set the color and opacity for shading
          borderColor: Colors.indigo, // Set the border color for the line
          borderWidth: 2,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
        ),
      ],
    );
  }
}

List<ChartData> getChartData() {
  return [
    ChartData('01 Jan', 100, 671),
    ChartData('02 Jan', 500, 624),
    ChartData('03 Jan', 200, 671),
    ChartData('04 Jan', 500, 487),
    ChartData('05 Jan', 130, 693),
    ChartData('06 Jan', 103, 721),
    ChartData('07 Jan', 783, 672),
    ChartData('08 Jan', 1000, 453),
    ChartData('09 Jan', 340, 400),
    ChartData('10 Jan', 420, 231),
    ChartData('11 Jan', 360, 423),
    ChartData('12 Jan', 1092, 416),
  ];
}
