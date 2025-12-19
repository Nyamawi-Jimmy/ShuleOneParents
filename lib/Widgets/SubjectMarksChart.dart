import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SubjectMarksChart extends StatelessWidget {
  final Map<String, double> subjectMarks;

  const SubjectMarksChart({
    super.key,
    required this.subjectMarks,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: theme.disabledColor.withOpacity(0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title
          Text(
            "Subject Performance",
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "Marks scored per subject",
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.disabledColor,
            ),
          ),
          const SizedBox(height: 16),

          /// Line Chart
          SizedBox(
            height: 280, // ⬅️ Increased height to fit tilted labels
            child: LineChart(
              LineChartData(
                minY: 0,
                maxY: 100,

                gridData: FlGridData(
                  show: true,
                  horizontalInterval: 20,
                  verticalInterval: 1, // ⬅️ one grid per subject
                  drawVerticalLine: true,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: theme.disabledColor.withOpacity(0.2),
                    strokeWidth: 1,
                  ),
                  getDrawingVerticalLine: (value) => FlLine(
                    color: theme.disabledColor.withOpacity(0.15),
                    strokeWidth: 1,
                  ),
                ),

                borderData: FlBorderData(show: false),
                lineTouchData: LineTouchData(enabled: true),

                titlesData: FlTitlesData(
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),

                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 20,
                      reservedSize: 36,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toInt().toString(),
                          style: theme.textTheme.bodySmall,
                        );
                      },
                    ),
                  ),

                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      reservedSize: 48, // ⬅️ IMPORTANT: space for rotated labels
                      getTitlesWidget: (value, meta) {
                        final index = value.toInt();
                        if (index < 0 || index >= subjectMarks.length) {
                          return const SizedBox.shrink();
                        }

                        final subject =
                        subjectMarks.keys.elementAt(index);

                        return Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Transform.rotate(
                            angle: -0.7, // ~40°
                            alignment: Alignment.topLeft,
                            child: Text(
                              subject,
                              style: theme.textTheme.bodySmall,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                lineBarsData: [_buildLine(theme)],
              ),
            ),
          ),
        ],
      ),
    );
  }

  LineChartBarData _buildLine(ThemeData theme) {
    return LineChartBarData(
      isCurved: false,
      color: theme.primaryColor,
      barWidth: 3,
      dotData: FlDotData(
        show: true,
        getDotPainter: (spot, percent, barData, index) {
          return FlDotCirclePainter(
            radius: 4,
            color: theme.primaryColor,
            strokeWidth: 2,
            strokeColor: Colors.white,
          );
        },
      ),
      belowBarData: BarAreaData(
        show: true,
        color: theme.primaryColor.withOpacity(0.15),
      ),
      spots: List.generate(
        subjectMarks.length,
            (index) => FlSpot(
          index.toDouble(),
          subjectMarks.values.elementAt(index),
        ),
      ),
    );
  }
}
