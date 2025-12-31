import 'package:flutter/material.dart';

enum LiveClassStatus { Live, Pending, Finished }

extension LiveClassStatusX on LiveClassStatus {
  static LiveClassStatus fromString(String value) {
    switch (value.toLowerCase()) {
      case 'live':
        return LiveClassStatus.Live;
      case 'pending':
        return LiveClassStatus.Pending;
      case 'finished':
        return LiveClassStatus.Finished;
      default:
        return LiveClassStatus.Pending; // safe fallback
    }
  }
}

class LiveClassCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final LiveClassStatus status;
  final String startsOn; // e.g., "20 Dec 2025, 10:00 AM"

  const LiveClassCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.status,
    required this.startsOn,
  });

  Color _getStatusColor(LiveClassStatus status, ThemeData theme) {
    switch (status) {
      case LiveClassStatus.Live:
        return Colors.green; // live can be green
      case LiveClassStatus.Pending:
        return Colors.blue; // pending can be orange
      case LiveClassStatus.Finished:
        return theme.disabledColor; // finished as grey
    }
  }

  String _getStatusText(LiveClassStatus status) {
    switch (status) {
      case LiveClassStatus.Live:
        return "Live";
      case LiveClassStatus.Pending:
        return "Pending";
      case LiveClassStatus.Finished:
        return "Finished";
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
            // Left: Class details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.access_time, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        "Starts on: $startsOn",
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Right: Status badge
            Container(
              width: 100, // consistent width
              height: 30, // consistent height
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
          ],
        ),
      ),
    );
  }
}
