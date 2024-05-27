import 'package:flutter/material.dart';

class DataTableWidget extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> data;

  const DataTableWidget({super.key, required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Add your export functionality here
                    },
                    icon: const Icon(Icons.download, color: Colors.white),
                    label: const Text('Export',style: TextStyle(color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                    ),
                  ),
                ],
              ),
              DataTable(
                columns: const [
                  DataColumn(label: Text('Channel')),
                  DataColumn(label: Text('Visits')),
                  DataColumn(label: Text('Progress')),
                ],
                rows: data
                    .map(
                      (item) => DataRow(
                        cells: [
                          DataCell(Text(item['label'])),
                          DataCell(Text(item['value'].toString())),
                          DataCell(LinearProgressIndicator(
                            value: item['progress'],
                            color: Colors.indigo,
                          )),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
