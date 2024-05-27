import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final String city;
  final int population;

  const ProgressBar({Key? key, required this.city, required this.population}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double progress = population / 100000; // Assuming max population is 100k
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            city,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey[300],
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.indigoAccent),
          ),
          const SizedBox(height: 8.0),
          Text('$population k'),
        ],
      ),
    );
  }
}