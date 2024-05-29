import 'package:flutter/material.dart';
import 'package:web_dashboard_example/component/dashboard_card.dart';
import 'package:web_dashboard_example/utils/resposive.dart';

class TopResponsiveGrid extends StatelessWidget {
  const TopResponsiveGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int columns;
        double aspectRatio;

        if (Responsive.isDesktop(context)) {
          columns = 4;
          aspectRatio = constraints.maxWidth > 1400
              ? 2.5
              : 2.15;
        } else if (Responsive.isTablet(context)) {
          columns = 2;
          aspectRatio = constraints.maxWidth > 1000
              ? 1.1
              : 1.5;
        } else {
          columns = 1;
          aspectRatio = constraints.maxWidth > 600
              ? 1.55
              : 1.5;
        }

        return GridView.count(
          crossAxisCount: columns,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: aspectRatio,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: const <Widget>[
            DashboardCard(
              title: 'CUSTOMERS',
              value: '54,214',
              icon: Icons.people,
              change: '+2,541',
              changeType: 'positive',
              backgroundColor: Colors.blue,
            ),
            DashboardCard(
              title: 'ORDERS',
              value: '7,543',
              icon: Icons.shopping_cart,
              change: '-1.08%',
              changeType: 'negative',
              backgroundColor: Colors.orange,
            ),
            DashboardCard(
              title: 'REVENUE',
              value: '\$9,254',
              icon: Icons.attach_money,
              change: '-7.00%',
              changeType: 'negative',
              backgroundColor: Colors.red,
            ),
            DashboardCard(
              title: 'CONVERSATION',
              value: '9.62%',
              icon: Icons.chat,
              change: '+3.07%',
              changeType: 'positive',
              backgroundColor: Colors.green,
            ),
            DashboardCard(
              title: 'BALANCE',
              value: '\$168.5k',
              icon: Icons.account_balance_wallet,
              change: '+18.34%',
              changeType: 'positive',
              backgroundColor: Colors.purple,
            ),
          ],
        );
      },
    );
  }
}
