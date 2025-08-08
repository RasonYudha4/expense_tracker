import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeeklyChart extends StatelessWidget {
  const WeeklyChart({super.key});

  @override
  Widget build(BuildContext context) {
    // Short weekday labels to avoid long overflow under the chart.
    const days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      child: Container(
        width: 320,
        padding: const EdgeInsets.all(20),
        child: LineChart(
          LineChartData(
            // Grid lines: horizontal lines only (less visual noise).
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              horizontalInterval: 1000,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: const Color(0xFF2D336B).withOpacity(0.08),
                  strokeWidth: 1,
                );
              },
            ),

            // Titles / axis labels
            titlesData: FlTitlesData(
              show: true,
              rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),

              // Bottom (X) labels
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 28,
                  interval: 1,
                  getTitlesWidget: (value, meta) {
                    final i = value.toInt();
                    if (i >= 0 && i < days.length) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Text(
                          days[i],
                          style: TextStyle(
                            color: const Color(0xFF2D336B).withOpacity(0.7),
                            fontWeight: FontWeight.w500,
                            fontSize: 11,
                          ),
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),

              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 1000,
                  reservedSize: 26,
                  getTitlesWidget: (value, meta) {
                    return Text(
                      '${(value / 1000).toInt()}k',
                      style: TextStyle(
                        color: const Color(0xFF2D336B).withOpacity(0.7),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    );
                  },
                ),
              ),
            ),

            // Border around chart
            borderData: FlBorderData(
              show: true,
              border: Border.all(
                color: const Color(0xFF2D336B).withOpacity(0.15),
                width: 1,
              ),
            ),

            // IMPORTANT: set X bounds to match your data points (0..6)
            minX: 0,
            maxX: 6,
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
                  getDotPainter: (spot, percent, barData, index) {
                    return FlDotCirclePainter(
                      radius: 4,
                      color: const Color(0xFF2D336B),
                      strokeWidth: 2,
                      strokeColor: Colors.white,
                    );
                  },
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

            // Touch / tooltip behavior
            lineTouchData: LineTouchData(
              enabled: true,
              touchTooltipData: LineTouchTooltipData(
                // Use a rounded tooltip background for readability
                getTooltipColor: (LineBarSpot touchedSpot) =>
                    const Color(0xFF2D336B),
                tooltipPadding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 6,
                ),
                getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                  return touchedBarSpots.map((barSpot) {
                    final dayIndex = barSpot.x.toInt();
                    final day = (dayIndex >= 0 && dayIndex < days.length)
                        ? days[dayIndex]
                        : '';
                    return LineTooltipItem(
                      '$day\n${barSpot.y.toInt()}',
                      const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    );
                  }).toList();
                },
              ),
              handleBuiltInTouches: true,
              getTouchLineStart: (data, index) => 0,
              getTouchLineEnd: (data, index) => 6000, // full vertical highlight
              touchSpotThreshold: 30,
            ),
          ),
        ),
      ),
    );
  }
}
