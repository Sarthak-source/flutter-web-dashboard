import 'package:flutter/material.dart';
import 'package:web_dashboard_example/component/data_table.dart';
import 'package:web_dashboard_example/component/horizontal_bar_chart.dart';
import 'package:web_dashboard_example/component/map_chart.dart';
import 'package:web_dashboard_example/utils/resposive.dart';

class MyResponsiveLayout extends StatelessWidget {
  const MyResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _buildGridView(context, 1),
      tablet: _buildGridView(context, 2),
      desktop: _buildGridView(context, 2),
    );
  }

  Widget _buildGridView(BuildContext context, int columns) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GridView.count(
          crossAxisCount: columns,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 1.5,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: const <Widget>[
            Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(flex: 3, child: MapChart()),
                    Expanded(flex: 2, child: BarCustomization()),
                  ],
                ),
              ),
            ),
            Card(
              child: DataTableWidget(
                title: 'Top Selling Products',
                data: [
                  {'label': 'Direct', 'value': 2050, 'progress': 0.8},
                  {'label': 'Organic Search', 'value': 1405, 'progress': 0.6},
                  {'label': 'Referral', 'value': 750, 'progress': 0.4},
                  {'label': 'Social', 'value': 540, 'progress': 0.3},
                  {'label': 'Other', 'value': 8965, 'progress': 1.0},
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
