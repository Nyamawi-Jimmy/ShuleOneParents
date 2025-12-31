import 'package:flutter/material.dart';

enum AssignmentStatus { Open, InProgress, Marked, Pending, Expired }

class AssignmentCard extends StatelessWidget {
  final String assignmentName;
  final String deadline;
  final AssignmentStatus status;
  final String? score;
  final VoidCallback? onShowResults;
  final VoidCallback? onStatement;
  final VoidCallback? onReceipt;
  final VoidCallback? onPayment;

  const AssignmentCard({
    super.key,
    required this.assignmentName,
    required this.deadline,
    required this.status,
    this.score,
    this.onShowResults,
    this.onStatement,
    this.onReceipt,
    this.onPayment,
  });

  Color _getStatusColor() {
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

  String _getStatusText() {
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
    final statusColor = _getStatusColor();

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Row(
        children: [
          // Vertical Status Strip
          Container(
            width: 6,
            height: 100,
            decoration: BoxDecoration(
              color: statusColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Assignment Name + Popup Menu (if Marked)
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          assignmentName,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: theme.primaryColor,
                          ),
                        ),
                      ),
                      if (status == AssignmentStatus.Marked)
                        PopupMenuButton<String>(
                          icon: Icon(Icons.more_vert, color: theme.primaryColor),
                          onSelected: (value) {
                            if (value == 'view') onShowResults?.call();
                          },
                          itemBuilder: (_) => [
                            const PopupMenuItem(
                              value: 'view',
                              child: Text("View Results"),
                            ),

                          ],
                        ),
                    ],
                  ),

                  const SizedBox(height: 6),
                  // Deadline
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
                  const SizedBox(height: 12),
                  // Status badge + Score
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Status badge
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: statusColor.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          _getStatusText(),
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: statusColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      // Score
                      Text(
                        score != null ? "Score: ${score!}" : "—",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
