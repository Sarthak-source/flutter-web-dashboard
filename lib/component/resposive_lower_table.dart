import 'package:flutter/material.dart';
import 'package:web_dashboard_example/component/data_table.dart';
import 'package:web_dashboard_example/utils/resposive.dart';

class MyResponsiveLayoutLower extends StatelessWidget {
  const MyResponsiveLayoutLower({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _buildGridView(
        context: context,
        columns: 1,
        aspectRatio: 1.5,
      ),
      tablet: _buildGridView(
        context: context,
        columns: 2,
        aspectRatio: 0.70,
      ),
      desktop: _buildGridView(
        context: context,
        columns: 2,
        aspectRatio: 1.5,
      ),
    );
  }

  Widget _buildGridView(
      {required BuildContext context, required int columns, aspectRatio}) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GridView.count(
          crossAxisCount: columns,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: aspectRatio,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: const <Widget>[
            DataTableWidget(
              title: 'Channels',
              data: [
                {'label': 'Direct', 'value': 2050, 'progress': 0.5},
                {'label': 'Organic Search', 'value': 1405, 'progress': 0.35},
                {'label': 'Referral', 'value': 750, 'progress': 0.18},
                {'label': 'Social', 'value': 540, 'progress': 0.12},
                {'label': 'Other', 'value': 8965, 'progress': 0.98},
              ],
            ),
            DataTableWidget(
              title: 'Social Media Traffic',
              data: [
                {'label': 'Facebook', 'value': 2250, 'progress': 0.5},
                {'label': 'Instagram', 'value': 1501, 'progress': 0.35},
                {'label': 'Twitter', 'value': 750, 'progress': 0.18},
                {'label': 'LinkedIn', 'value': 540, 'progress': 0.12},
                {'label': 'Other', 'value': 13851, 'progress': 0.98},
              ],
            ),
            DataTableWidget(
              title: 'Engagement Overview',
              data: [
                {'label': '0-30', 'value': 2250, 'progress': 0.5},
                {'label': '31-60', 'value': 1501, 'progress': 0.35},
                {'label': '61-120', 'value': 750, 'progress': 0.18},
                {'label': '121-240', 'value': 540, 'progress': 0.12},
                {'label': '141-420', 'value': 56, 'progress': 0.01},
              ],
            ),
          ],
        );
      },
    );
  }
}
