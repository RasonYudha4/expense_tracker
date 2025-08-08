import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MonthlyChart extends StatelessWidget {
  const MonthlyChart({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample monthly data for 30 days. Replace with your real values.
    final List<double> monthlyData = [
      1200,
      1500,
      1100,
      2000,
      1800,
      2200,
      2100,
      2500,
      2300,
      2700,
      2600,
      3000,
      2800,
      3200,
      2900,
      3400,
      3300,
      3600,
      3500,
      3800,
      3700,
      4000,
      3900,
      4200,
      4100,
      4400,
      4300,
      4600,
      4500,
      4800,
    ];

    // Build FlSpots from the data (x: 0..29)
    final spots = monthlyData.asMap().entries.map((e) {
      return FlSpot(e.key.toDouble(), e.value);
    }).toList();

    // Compute a nice maxY with some headroom
    final rawMax = monthlyData.reduce((a, b) => a > b ? a : b);
    // add 20% headroom
    final computedMaxY = (rawMax * 1.2).ceilToDouble();
    // Compute an approximate horizontal interval (5 lines)
    final horizInterval = (computedMaxY / 5).ceilToDouble();

    // Choose an X-label interval so labels aren't crowded
    const int labelInterval = 5; // show every 5th day: 1,6,11,...
    const int days = 30;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      child: Container(
        width: double.infinity,
        height: 300,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF2D336B).withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: LineChart(
          LineChartData(
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              horizontalInterval: horizInterval,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: const Color(0xFF2D336B).withOpacity(0.08),
                  strokeWidth: 1,
                );
              },
            ),
            titlesData: FlTitlesData(
              show: true,
              rightTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 32,
                  interval: 1,
                  getTitlesWidget: (value, meta) {
                    final i = value.toInt();
                    // show only for selected ticks to avoid overlap
                    if (i >= 0 &&
                        i < days &&
                        (i % labelInterval == 0 || i == days - 1)) {
                      // label is 1-based day number
                      final label = (i + 1).toString();
                      return Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Text(
                          label,
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
                  interval: horizInterval,
                  reservedSize: 46,
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
            borderData: FlBorderData(
              show: true,
              border: Border.all(
                color: const Color(0xFF2D336B).withOpacity(0.15),
                width: 1,
              ),
            ),
            minX: 0,
            maxX: (days - 1).toDouble(), // 0..29
            minY: 0,
            maxY: computedMaxY,
            lineBarsData: [
              LineChartBarData(
                spots: spots,
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
                  show:
                      false, // hide all dots to reduce clutter; you can enable if desired
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
              handleBuiltInTouches: true,
              touchSpotThreshold: 30,
              getTouchLineStart: (data, index) => 0,
              getTouchLineEnd: (data, index) => computedMaxY,
              touchTooltipData: LineTouchTooltipData(
                getTooltipColor: (LineBarSpot touchedSpot) =>
                    const Color(0xFF2D336B),
                tooltipPadding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                tooltipBorderRadius: BorderRadius.circular(6),
                getTooltipItems: (touchedSpots) {
                  return touchedSpots.map((barSpot) {
                    final day = barSpot.x.toInt() + 1; // 1-based day number
                    final value = barSpot.y.toInt();
                    return LineTooltipItem(
                      'Day $day\n$value',
                      const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    );
                  }).toList();
                },
                fitInsideHorizontally: true,
                fitInsideVertically: true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
