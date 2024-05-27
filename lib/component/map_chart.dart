import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:web_dashboard_example/models/map_model.dart';

class MapChart extends StatefulWidget {
  const MapChart({Key? key}) : super(key: key);

  @override
  State<MapChart> createState() => _MapChartState();
}

class _MapChartState extends State<MapChart> {
  @override
  Widget build(BuildContext context) {
    return SfMaps(
      layers: [
        MapShapeLayer(
          source: const MapShapeSource.asset(
            'assets/world_map.json',
            shapeDataField: 'name',
          ),
          initialMarkersCount: 4,
          markerBuilder: (BuildContext context, int index) {
            return MapMarker(
              latitude: _markerData[index].latitude,
              longitude: _markerData[index].longitude,
              child:
                   Icon(Icons.circle, color: Colors.indigo.withOpacity(0.6), size: 20),
            );
          },
          markerTooltipBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(_markerData[index].country),
            );
          },
          // Set the border color to white
         
        ),
      ],
    );
  }
}

List<MarkerData> get _markerData => [
      MarkerData('United States', 37.0902, -95.7129),
      MarkerData('Australia', -25.2744, 133.7751),
      MarkerData('India', 20.5937, 78.9629),
      MarkerData('Singapore', 1.3521, 103.8198),
    ];
