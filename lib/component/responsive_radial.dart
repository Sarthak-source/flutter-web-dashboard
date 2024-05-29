import 'package:flutter/material.dart';
import 'package:web_dashboard_example/component/progress_bar.dart';
import 'package:web_dashboard_example/utils/resposive.dart';

import 'line_bar_chart.dart';
import 'radial_graph.dart';

class MiddleResponsiveSecondGrid extends StatelessWidget {
  const MiddleResponsiveSecondGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _buildGridView(
          context: context, columns: 1, aspectRatio: 0.50, fontSize: 12),
      tablet: _buildGridView(
          context: context, columns: 2, aspectRatio: 0.70, fontSize: 12),
      desktop: _buildGridView(
          context: context, columns: 2, aspectRatio: 0.9, fontSize: 16),
    );
  }

  Widget _buildGridView(
      {required BuildContext context,
      required int columns,
      required double aspectRatio,
      required double fontSize}) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GridView.count(
          crossAxisCount: columns,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: aspectRatio,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            const Card(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Text(
                          'Total sales',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: RadialGraph(),
                  ),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          ProgressBar(
                            city: 'Brooklyn, New York',
                            population: 72000,
                          ),
                          ProgressBar(
                            city: 'The Castro, San Francisco',
                            population: 39000,
                          ),
                          ProgressBar(
                            city: 'Kovan, Singapore',
                            population: 61000,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Text(
                          'Revenue',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 2, vertical: 10),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Current Week',
                                  style: TextStyle(
                                      fontSize: fontSize,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '\$1705.54',
                                  style: TextStyle(
                                      fontSize: fontSize + 4,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Previous Week',
                                  style: TextStyle(
                                      fontSize: fontSize,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '\$6,523.25',
                                  style: TextStyle(
                                      fontSize: fontSize + 4,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Conversation',
                                  style: TextStyle(
                                      fontSize: fontSize,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '8.27%',
                                  style: TextStyle(
                                      fontSize: fontSize + 4,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Customers',
                                  style: TextStyle(
                                      fontSize: fontSize,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '69k',
                                  style: TextStyle(
                                      fontSize: fontSize + 4,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  const LineBarChart(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
