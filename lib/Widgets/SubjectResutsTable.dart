import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubjectResultsTable extends StatelessWidget {
  const SubjectResultsTable({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final List<SubjectResult> results = [
      SubjectResult(subject: "Mathematics", marks: 72, grade: "B", position: 8, deviation: 5),
      SubjectResult(subject: "English", marks: 65, grade: "B-", position: 14, deviation: 2),
      SubjectResult(subject: "Biology", marks: 70, grade: "B", position: 10, deviation: 4),
      SubjectResult(subject: "Chemistry", marks: 58, grade: "C+", position: 18, deviation: -1),
      SubjectResult(subject: "Physics", marks: 61, grade: "B-", position: 15, deviation: 1),
      SubjectResult(subject: "Geography", marks: 75, grade: "B+", position: 6, deviation: 6),
    ];


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
                rows: results.map((r) {
                  return DataRow(
                    cells: [
                      DataCell(
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 120),
                          child: Text(
                            r.subject,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      DataCell(Text(r.marks.toString())),
                      DataCell(_gradeChip(r.grade, theme)),
                      DataCell(Text(r.position.toString())),
                      DataCell(_deviationText(r.deviation, theme)),
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
  static Widget _gradeChip(String grade, ThemeData theme) {
    Color color;

    switch (grade) {
      case "A":
      case "A-":
        color = Colors.green;
        break;
      case "B+":
      case "B":
      case "B-":
        color = Colors.blue;
        break;
      case "C+":
      case "C":
        color = Colors.orange;
        break;
      default:
        color = Colors.red;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        grade,
        style: theme.textTheme.bodySmall?.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

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
