import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final String language;
  final String description;
  final double progress; // 0.0 – 1.0
  final IconData icon;
  final VoidCallback onTap;

  const CourseCard({
    super.key,
    required this.language,
    required this.description,
    required this.progress,
    required this.icon,
    required this.onTap,
  });

  String _backgroundForLanguage() {
    switch (language.toLowerCase()) {
      case "python":
        return "assets/images/shuleone.png";
      case "dart":
        return "assets/images/shuleone.png";
      case "javascript":
        return "assets/images/shuleone.png";
      default:
        return "assets/images/shuleone.png";
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool started = progress > 0;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Column(
          children: [
            Card(
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
                          child: Icon(
                            icon,
                            color: Colors.white,
                            size: 26,
                          ),
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
                      style: theme.textTheme.bodySmall?.copyWith(
                      ),
                    ),

                    const SizedBox(height: 14),

                    /// PROGRESS LABEL
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Progress",
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: theme.primaryColor,
                          ),
                        ),
                        Text(
                          "${(progress * 100).toInt()}%",
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: theme.primaryColor,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 6),

                    /// PROGRESS BAR
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
                        onPressed: onTap,
                        style: OutlinedButton.styleFrom(
                          foregroundColor:theme.primaryColor,
                          side: BorderSide(color: theme.primaryColor.withOpacity(0.8)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          started ? "Continue Course" : "Start Course",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            /// 🔹 CONTENT

          ],
        ),
      ),
    );
  }
}
