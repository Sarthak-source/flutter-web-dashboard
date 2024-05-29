import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:web_dashboard_example/component/date_picker.dart';
import 'package:web_dashboard_example/component/responsive_info_grid.dart';
import 'package:web_dashboard_example/component/responsive_radial.dart';
import 'package:web_dashboard_example/component/responsive_table_one.dart';
import 'package:web_dashboard_example/component/resposive_lower_table.dart';

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
      log('message');

      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    log(width.toString());

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
          const Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Text('Dashboard',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                      Spacer(),
                      DatePickerWidget(),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  TopResponsiveGrid(),
                  SizedBox(height: 16.0),
                  MiddleResponsiveSecondGrid(),
                  MyResponsiveLayout(),
                  MyResponsiveLayoutLower(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
