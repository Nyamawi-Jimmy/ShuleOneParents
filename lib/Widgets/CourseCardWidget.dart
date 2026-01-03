import 'package:flutter/material.dart';
enum CourseStatus {
  closed,
  learnNow,
}


class CourseCard extends StatelessWidget {
  final String language;
  final String description;
  final double progress; // 0.0 – 1.0
  final IconData icon;
  final VoidCallback onTap;
  final CourseStatus status;

  const CourseCard({
    super.key,
    required this.language,
    required this.description,
    required this.progress,
    required this.icon,
    required this.onTap,
    required this.status,
  });

  bool get started => progress > 0;

  String get buttonText {
    if (status == CourseStatus.closed) return "Closed";
    if (started) return "Continue Learning";
    return "Learn Now";
  }

  bool get isDisabled => status == CourseStatus.closed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// ICON + TITLE
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: theme.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(icon, color: theme.primaryColor, size: 26),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      language,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              /// DESCRIPTION
              Text(
                description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodySmall,
              ),

              const SizedBox(height: 14),

              /// PROGRESS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Progress",
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: theme.primaryColor,
                      )),
                  Text("${(progress * 100).toInt()}%",
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: theme.primaryColor,
                      )),
                ],
              ),

              const SizedBox(height: 6),

              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 6,
                  backgroundColor: theme.disabledColor,
                  color: theme.primaryColor,
                ),
              ),

              const SizedBox(height: 14),

              /// ACTION BUTTON
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: isDisabled ? null : onTap,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: isDisabled
                        ? theme.disabledColor
                        : theme.primaryColor,
                    side: BorderSide(
                      color: isDisabled
                          ? theme.disabledColor
                          : theme.primaryColor,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(buttonText),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
