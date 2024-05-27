import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class RadialGraph extends StatefulWidget {
  const RadialGraph({Key? key}) : super(key: key);

  @override
  State<RadialGraph> createState() => _RadialGraphState();
}

class _RadialGraphState extends State<RadialGraph> {
  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      enableLoadingAnimation: true,
      axes: <RadialAxis>[
        RadialAxis(
          showLabels: false,
          showTicks: false,
          radiusFactor: 0.8,
          maximum: 100,
          axisLineStyle: const AxisLineStyle(thickness: 5),
          pointers: const <GaugePointer>[
            RangePointer(
              value: 67,
              width: 18,
              pointerOffset: -6,
              color: Color(0xFFF67280),
              gradient: SweepGradient(
                colors: <Color>[Colors.indigo, Colors.indigoAccent],
                stops: <double>[0.25, 0.75],
              ),
            ),
            MarkerPointer(
              value: 100,
              color: Colors.white,
              markerType: MarkerType.circle,
            ),
          ],
        ),
      ],
    );
  }
}
