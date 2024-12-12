import 'package:flutter/material.dart';
import 'package:mobx_imc/widgets/imc_gauge_range.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ImcGauge extends StatelessWidget {
  final double imc;
  const ImcGauge({super.key, required this.imc});

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
        enableLoadingAnimation: true,
        axes: [
          RadialAxis(
            showTicks: false,
            showLabels: false,
            showAxisLine: false,
            minimum: 12.5,
            maximum: 44.9,
            ranges: [
              GaugeRangebase(
                  color: const Color.fromARGB(255, 51, 37, 180),
                  start: 12.5,
                  end: 18.5,
                  label: 'Magro'),
              GaugeRangebase(
                  color: const Color.fromARGB(255, 52, 175, 165),
                  start: 18.6,
                  end: 24.9,
                  label: 'Normal'),
              GaugeRangebase(
                  color: const Color.fromARGB(255, 28, 173, 72),
                  start: 25,
                  end: 29.9,
                  label: 'Sobrepeso'),
              GaugeRangebase(
                  color: const Color.fromARGB(255, 214, 218, 27),
                  start: 30,
                  end: 34.9,
                  label: 'Obesidade'),
              GaugeRangebase(
                color: const Color.fromARGB(255, 209, 134, 21),
                start: 35,
                end: 39.9,
                label: 'Obesidade grave',
              ),
              GaugeRangebase(
                color: const Color.fromARGB(255, 240, 26, 11),
                start: 40,
                end: 44.9,
                label: 'Obesidade extrema',
              )
            ],
            pointers: [
              NeedlePointer(
                value: imc,
                enableAnimation: true,
              )
            ],
          ),
        ],
      );
  }
}
