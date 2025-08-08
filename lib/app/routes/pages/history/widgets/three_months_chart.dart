import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ThreeMonthsChart extends StatelessWidget {
  const ThreeMonthsChart({super.key});

  @override
  Widget build(BuildContext context) {
    const weeks = [
      'W1 Jan',
      'W2 Jan',
      'W3 Jan',
      'W4 Jan',
      'W1 Feb',
      'W2 Feb',
      'W3 Feb',
      'W4 Feb',
      'W1 Mar',
      'W2 Mar',
      'W3 Mar',
      'W4 Mar',
    ];

    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      child: Container(
        width: 320,
        padding: const EdgeInsets.all(20),
        child: LineChart(
          LineChartData(
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              horizontalInterval: 1000,
              getDrawingHorizontalLine: (value) => FlLine(
                color: const Color(0xFF2D336B).withOpacity(0.08),
                strokeWidth: 1,
              ),
            ),
            titlesData: FlTitlesData(
              show: true,
              rightTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 1000,
                  reservedSize: 26,
                  getTitlesWidget: (value, meta) => Text(
                    '${(value / 1000).toInt()}k',
                    style: TextStyle(
                      color: const Color(0xFF2D336B).withOpacity(0.7),
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(
                color: const Color(0xFF2D336B).withOpacity(0.15),
                width: 1,
              ),
            ),
            minX: 0,
            maxX: 11,
            minY: 0,
            maxY: 6000,
            lineBarsData: [
              LineChartBarData(
                spots: const [
                  FlSpot(0, 2800),
                  FlSpot(1, 3200),
                  FlSpot(2, 2900),
                  FlSpot(3, 3800),
                  FlSpot(4, 4200),
                  FlSpot(5, 3600),
                  FlSpot(6, 4800),
                  FlSpot(7, 4400),
                  FlSpot(8, 5000),
                  FlSpot(9, 4700),
                  FlSpot(10, 5300),
                  FlSpot(11, 4900),
                ],
                isCurved: true,
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF2D336B),
                    const Color(0xFF2D336B).withOpacity(0.8),
                  ],
                ),
                barWidth: 3,
                isStrokeCapRound: true,
                dotData: FlDotData(
                  show: true,
                  getDotPainter: (spot, percent, barData, index) =>
                      FlDotCirclePainter(
                    radius: 4,
                    color: const Color(0xFF2D336B),
                    strokeWidth: 2,
                    strokeColor: Colors.white,
                  ),
                ),
                belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF2D336B).withOpacity(0.18),
                      const Color(0xFF2D336B).withOpacity(0.04),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ],
            lineTouchData: LineTouchData(
              enabled: true,
              touchTooltipData: LineTouchTooltipData(
                getTooltipColor: (_) => const Color(0xFF2D336B),
                tooltipPadding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                getTooltipItems: (spots) => spots.map((barSpot) {
                  final weekIndex = barSpot.x.toInt();
                  final label = (weekIndex >= 0 && weekIndex < weeks.length)
                      ? weeks[weekIndex]
                      : '';
                  return LineTooltipItem(
                    '$label\n${barSpot.y.toInt()}',
                    const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  );
                }).toList(),
              ),
              handleBuiltInTouches: true,
              getTouchLineStart: (_, __) => 0,
              getTouchLineEnd: (_, __) => 6000,
              touchSpotThreshold: 30,
            ),
          ),
        ),
      ),
    );
  }
}
