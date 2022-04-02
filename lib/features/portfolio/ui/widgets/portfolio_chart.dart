import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../domain/char_data.dart';

class PortfolioChart extends StatelessWidget {
  final TooltipBehavior tooltipBehavior;
  final List<ChartData> chartData;

  const PortfolioChart({
    Key? key,
    required this.tooltipBehavior,
    required this.chartData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      tooltipBehavior: tooltipBehavior,
      series: <CircularSeries>[
        DoughnutSeries<ChartData, String>(
          enableTooltip: true,
          explode: true,
          dataSource: chartData,
          pointColorMapper: (ChartData data, _) => data.color,
          xValueMapper: (ChartData data, _) => data.coinName,
          yValueMapper: (ChartData data, _) =>
              double.parse(data.value.toStringAsFixed(2)),
        ),
      ],
    );
  }
}
