import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:web_dashboard_example/component/dashboard_card.dart';
import 'package:web_dashboard_example/component/data_table.dart';
import 'package:web_dashboard_example/component/date_picker.dart';
import 'package:web_dashboard_example/component/horizontal_bar_chart.dart';
import 'package:web_dashboard_example/component/line_bar_chart.dart';
import 'package:web_dashboard_example/component/map_chart.dart';
import 'package:web_dashboard_example/component/progress_bar.dart';
import 'package:web_dashboard_example/component/radial_graph.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  bool isSidebarExpanded = false;
  DateTime selectedDate = DateTime.now();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JIDOX'),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.grey),
            onPressed: () {},
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Text(
                'English',
                style: TextStyle(color: Colors.grey[600]),
              ),
              Icon(Icons.arrow_drop_down, color: Colors.grey[600]),
            ],
          ),
          const SizedBox(width: 16),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications, color: Colors.grey),
                onPressed: () {},
              ),
              Positioned(
                right: 11,
                top: 11,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 12,
                    minHeight: 12,
                  ),
                  child: const Text(
                    '1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.apps, color: Colors.grey),
            onPressed: () {
              log('message');
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.grey),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.brightness_6, color: Colors.grey),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.fullscreen, color: Colors.grey),
            onPressed: () {},
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://via.placeholder.com/150'), // Replace with actual image URL
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Doris Larson',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Founder',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      body: Row(
        children: [
          MouseRegion(
            onEnter: (_) {
              setState(() {
                isSidebarExpanded = true;
              });
            },
            onExit: (_) {
              setState(() {
                isSidebarExpanded = false;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: isSidebarExpanded ? 200.0 : 70.0,
              child: Drawer(
                child: ListView(
                  children: <Widget>[
                    if (isSidebarExpanded)
                      const UserAccountsDrawerHeader(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  'https://images.pexels.com/photos/531880/pexels-photo-531880.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                                ))),
                        accountName: Text(
                          'Doris Larson',
                          style: TextStyle(color: Colors.white),
                        ),
                        accountEmail: Text(
                          'Founder',
                          style: TextStyle(color: Colors.white),
                        ),
                        currentAccountPicture: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Text('D'),
                        ),
                      ),
                    ListTile(
                      leading: const Icon(Icons.dashboard),
                      title: isSidebarExpanded ? const Text('Dashboard') : null,
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.calendar_today),
                      title: isSidebarExpanded ? const Text('Calendar') : null,
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.chat),
                      title: isSidebarExpanded ? const Text('Chat') : null,
                      onTap: () {},
                    ),
                    ExpansionTile(
                      trailing: null,
                      leading: const Icon(Icons.email),
                      title:
                          isSidebarExpanded ? const Text('Email') : Container(),
                      children: [
                        ListTile(
                          title: const Text('Inbox'),
                          onTap: () {
                            // Add your functionality for Inbox
                          },
                        ),
                        ListTile(
                          title: const Text('Read Mail'),
                          onTap: () {
                            // Add your functionality for Read Mail
                          },
                        ),
                      ],
                    ),
                    ListTile(
                      leading: const Icon(Icons.check_box),
                      title: isSidebarExpanded ? const Text('Tasks') : null,
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.storage),
                      title:
                          isSidebarExpanded ? const Text('File Manager') : null,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Row(
                    children: [
                      Text('Dashboard',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                      Spacer(),
                      DatePickerWidget(),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      int columns = constraints.maxWidth > 1200
                          ? 4
                          : constraints.maxWidth > 800
                              ? 3
                              : constraints.maxWidth > 600
                                  ? 2
                                  : 1;
                      return GridView.count(
                        crossAxisCount: columns,
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                        childAspectRatio: 2.5,
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
                  ),
                  const SizedBox(height: 16.0),

                  LayoutBuilder(
                    builder: (context, constraints) {
                      int columns = constraints.maxWidth > 1200
                          ? 2
                          : constraints.maxWidth > 600
                              ? 2
                              : 1;
                      return GridView.count(
                        crossAxisCount: columns,
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                        childAspectRatio: 1.2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: const <Widget>[
                          Card(
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
                          )),
                          Card(
                            child: Column(
                              children: [
                               
                                Padding(
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
                                 Spacer(flex: 1,),
                                Card(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 40),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Current Week',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              '\$1705.54',
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Previous Week',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              '\$6,523.25',
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Conversation',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              '8.27%',
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Customers',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              '69k',
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Spacer(flex: 1,),
                                LineBarChart(),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),

                  LayoutBuilder(
                    builder: (context, constraints) {
                      int columns = constraints.maxWidth > 1200
                          ? 2
                          : constraints.maxWidth > 600
                              ? 2
                              : 1;
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
                                {
                                  'label': 'Direct',
                                  'value': 2050,
                                  'progress': 0.8
                                },
                                {
                                  'label': 'Organic Search',
                                  'value': 1405,
                                  'progress': 0.6
                                },
                                {
                                  'label': 'Referral',
                                  'value': 750,
                                  'progress': 0.4
                                },
                                {
                                  'label': 'Social',
                                  'value': 540,
                                  'progress': 0.3
                                },
                                {
                                  'label': 'Other',
                                  'value': 8965,
                                  'progress': 1.0
                                },
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),

                  LayoutBuilder(
                    builder: (context, constraints) {
                      int columns = constraints.maxWidth > 1200
                          ? 3
                          : constraints.maxWidth > 600
                              ? 2
                              : 1;
                      return GridView.count(
                        crossAxisCount: columns,
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                        childAspectRatio: 1.05,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: const <Widget>[
                          DataTableWidget(
                            title: 'Channels',
                            data: [
                              {
                                'label': 'Direct',
                                'value': 2050,
                                'progress': 0.5
                              },
                              {
                                'label': 'Organic Search',
                                'value': 1405,
                                'progress': 0.35
                              },
                              {
                                'label': 'Referral',
                                'value': 750,
                                'progress': 0.18
                              },
                              {
                                'label': 'Social',
                                'value': 540,
                                'progress': 0.12
                              },
                              {
                                'label': 'Other',
                                'value': 8965,
                                'progress': 0.98
                              },
                            ],
                          ),
                          DataTableWidget(
                            title: 'Social Media Traffic',
                            data: [
                              {
                                'label': 'Facebook',
                                'value': 2250,
                                'progress': 0.5
                              },
                              {
                                'label': 'Instagram',
                                'value': 1501,
                                'progress': 0.35
                              },
                              {
                                'label': 'Twitter',
                                'value': 750,
                                'progress': 0.18
                              },
                              {
                                'label': 'LinkedIn',
                                'value': 540,
                                'progress': 0.12
                              },
                              {
                                'label': 'Other',
                                'value': 13851,
                                'progress': 0.98
                              },
                            ],
                          ),
                          DataTableWidget(
                            title: 'Engagement Overview',
                            data: [
                              {'label': '0-30', 'value': 2250, 'progress': 0.5},
                              {
                                'label': '31-60',
                                'value': 1501,
                                'progress': 0.35
                              },
                              {
                                'label': '61-120',
                                'value': 750,
                                'progress': 0.18
                              },
                              {
                                'label': '121-240',
                                'value': 540,
                                'progress': 0.12
                              },
                              {
                                'label': '141-420',
                                'value': 56,
                                'progress': 0.01
                              },
                            ],
                          ),
                        ],
                      );
                    },
                  ),

                  // Get the height of the layout

                  // Add more widgets for Total Sales, Revenue, etc.
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
