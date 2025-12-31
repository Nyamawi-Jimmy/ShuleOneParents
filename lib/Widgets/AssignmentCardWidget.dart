import 'package:flutter/material.dart';

enum AssignmentStatus { Open, InProgress, Marked, Pending, Expired }

class AssignmentCard extends StatelessWidget {
  final String assignmentName;
  final String deadline;
  final AssignmentStatus status;
  final double? score;
  final VoidCallback? onShowResults;

  const AssignmentCard({
    super.key,
    required this.assignmentName,
    required this.deadline,
    required this.status,
    this.score,
    this.onShowResults,
  });

  Color _getStatusColor(AssignmentStatus status, ThemeData theme) {
    switch (status) {
      case AssignmentStatus.Open:
        return Colors.green;
      case AssignmentStatus.InProgress:
        return Colors.indigo;
      case AssignmentStatus.Marked:
        return Colors.blue;
      case AssignmentStatus.Pending:
        return Colors.grey;
      case AssignmentStatus.Expired:
        return Colors.red;
    }
  }

  String _getStatusText(AssignmentStatus status) {
    switch (status) {
      case AssignmentStatus.Open:
        return "Open";
      case AssignmentStatus.InProgress:
        return "In Progress";
      case AssignmentStatus.Marked:
        return "Marked";
      case AssignmentStatus.Pending:
        return "Pending";
      case AssignmentStatus.Expired:
        return "Expired";
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final statusColor = _getStatusColor(status, theme);

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Left: Assignment details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    assignmentName,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        "Deadline: $deadline",
                        style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Right: Status badge + Score + Show Results button
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Status badge
                Container(
                  width: 100,
                  height: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    _getStatusText(status),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: statusColor,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 8),

                // Score + "Show Results" button
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      score != null
                          ? "Score: ${score!.toStringAsFixed(1)}"
                          : "Score: —",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (status == AssignmentStatus.Marked && onShowResults != null)
                      const SizedBox(width: 8),
                    if (status == AssignmentStatus.Marked && onShowResults != null)
                      ElevatedButton.icon(
                        onPressed: onShowResults,
                        icon: const Icon(Icons.bar_chart, size: 18),
                        label: const Text(
                          "View Results",
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 2,
                          backgroundColor: Colors.blueAccent,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          textStyle: const TextStyle(letterSpacing: 0.5),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
