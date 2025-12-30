import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubjectResultsTable extends StatelessWidget {
  final List<dynamic> results;
  const SubjectResultsTable({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: theme.disabledColor.withOpacity(0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Subject Performance Breakdown",
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),

          /// Horizontal scroll safety
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width,
              ),
              child: DataTable(
                headingRowHeight: 42,
                dataRowHeight: 44,
                columnSpacing: 24,
                headingTextStyle: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: theme.primaryColor,
                ),
                dataTextStyle: theme.textTheme.bodySmall,
                columns: const [
                  DataColumn(label: Text("Subject")),
                  DataColumn(label: Text("Marks")),
                  DataColumn(label: Text("Grade")),
                  DataColumn(label: Text("Position")),
                  DataColumn(label: Text("Deviation")),
                ],
                rows: results.map((item) {
                  final String subjectCode = item['sub'];
                  final String score = item['score']; // "87/100"
                  final String grade = item['grade'];
                  final String position = item['pos'];
                  final int deviation = item['scoreDiff'];

                  return DataRow(
                    cells: [
                      DataCell(Text(subjectCode)),
                      DataCell(Text(score)),
                      DataCell(Text(grade)),
                      DataCell(Text(position)),
                      DataCell(_deviationText(deviation, theme)),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Grade badge
  /// Deviation (+ / -)
  /// Deviation with trend icon
  static Widget _deviationText(int deviation, ThemeData theme) {
    final bool isPositive = deviation > 0;
    final bool isNegative = deviation < 0;

    IconData icon;
    Color color;

    if (isPositive) {
      icon = Icons.trending_up;
      color = Colors.green;
    } else if (isNegative) {
      icon = Icons.trending_down;
      color = Colors.red;
    } else {
      icon = Icons.trending_flat;
      color = theme.disabledColor;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 18,
          color: color,
        ),
        const SizedBox(width: 4),
        Text(
          "${isPositive ? '+' : ''}$deviation",
          style: theme.textTheme.bodySmall?.copyWith(
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
class SubjectResult {
  final String subject;
  final int marks;
  final String grade;
  final int position;
  final int deviation;

  SubjectResult({
    required this.subject,
    required this.marks,
    required this.grade,
    required this.position,
    required this.deviation,
  });
}
