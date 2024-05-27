import 'package:flutter/material.dart';

import 'views/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define a custom white color swatch
    const MaterialColor whiteSwatch = MaterialColor(
      0xFFFFFFFF, // White color value
      <int, Color>{
        50: Color(0xFFFFFFFF), // White shade 50
        100: Color(0xFFFFFFFF), // White shade 100
        200: Color(0xFFFFFFFF), // White shade 200
        300: Color(0xFFFFFFFF), // White shade 300
        400: Color(0xFFFFFFFF), // White shade 400
        500: Color(0xFFFFFFFF), // White shade 500
        600: Color(0xFFFFFFFF), // White shade 600
        700: Color(0xFFFFFFFF), // White shade 700
        800: Color(0xFFFFFFFF), // White shade 800
        900: Color(0xFFFFFFFF), // White shade 900
      },
    );

    return MaterialApp(
      title: 'Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Use the custom white color swatch as the primary swatch
        primarySwatch: whiteSwatch,
      ),
      home: const DashboardScreen(),
    );
  }
}

List<SalesData> getChartDataS() {
  final List<SalesData> chartData = [
    SalesData('2016', 25),
    SalesData('2017', 12),
    SalesData('2018', 24),
    SalesData('2019', 18),
    SalesData('2020', 30)
  ];
  return chartData;
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}

// ignore: unused_element
class _ChartData {
  _ChartData(this.x, this.y);

  final dynamic x;
  final dynamic y;
}

Widget buildLocationRow(String location, int value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(location, style: const TextStyle(fontSize: 14)),
        Row(
          children: [
            Container(
              width: 100,
              height: 8,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(width: 8),
            Text('${(value / 1000).toStringAsFixed(0)}k',
                style: const TextStyle(fontSize: 14)),
          ],
        ),
      ],
    ),
  );
}

class ChartSampleData {
  ChartSampleData({this.x, this.y, this.text, this.pointColor});

  final String? x;
  final double? y;
  final String? text;
  final Color? pointColor;
}
