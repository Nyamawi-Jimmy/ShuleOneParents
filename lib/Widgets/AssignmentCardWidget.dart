import 'package:flutter/material.dart';

enum AssignmentStatus { Open, InProgress, Marked, Pending }

class AssignmentCard extends StatelessWidget {
  final String assignmentName;
  final String deadline;
  final AssignmentStatus status;
  final double? score; // Nullable, only available if marked

  const AssignmentCard({
    super.key,
    required this.assignmentName,
    required this.deadline,
    required this.status,
    this.score,
  });

  // Use theme colors instead of hardcoded ones
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
            // Left side: Assignment details
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
                      const Icon(Icons.calendar_today, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        "Deadline: $deadline",
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Right side: Status badge + Score
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Fixed size status container
                Container(
                  width: 100,
                  // fixed width
                  height: 30,
                  // fixed height
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
                const SizedBox(height: 6),
                Text(
                  score != null
                      ? "Score: ${score!.toStringAsFixed(1)}"
                      : "Score: —",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
