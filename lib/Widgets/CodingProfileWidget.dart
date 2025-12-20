import 'package:flutter/material.dart';

class CodingProfileCard extends StatelessWidget {
  const CodingProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// PROFILE HEADER
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 42,
                  backgroundColor: theme.primaryColor.withOpacity(0.15),
                  child: Icon(
                    Icons.person,
                    size: 42,
                    color: theme.primaryColor,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "Jimmy Nyamawi",
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Day 42 of coding 🚀",
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.disabledColor,
                  ),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.person_add),
                  label: const Text("Add Friend"),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          /// STATS ROW: Streak, XP, Followers, Following
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _stat(theme, "Streak", "7🔥"),
              _stat(theme, "XP", "1240"),
              _clickableStat(context, theme, "Followers", 86),
              _clickableStat(context, theme, "Following", 45),
            ],
          ),

          const SizedBox(height: 24),

          /// CURRENT COURSE
          Text(
            "Current Course",
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          _currentCourseCard(
            context,
            title: "Flutter Development",
            description:
            "Build beautiful cross-platform mobile applications using Flutter & Dart.",
            progress: 0.65,
          ),

          const SizedBox(height: 24),

          /// COMPLETED COURSES
          Text(
            "Completed Courses",
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              _completedCourseCard(context, "Python Basics"),
              _completedCourseCard(context, "JavaScript Essentials"),
              _completedCourseCard(context, "HTML & CSS"),
            ],
          ),

          const SizedBox(height: 24),

          /// ACHIEVEMENTS
          Text(
            "Achievements",
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            children: const [
              _Achievement(icon: Icons.local_fire_department, label: "7 Day Streak"),
              _Achievement(icon: Icons.bolt, label: "1000 XP"),
              _Achievement(icon: Icons.emoji_events, label: "Top Learner"),
              _Achievement(icon: Icons.code, label: "First App"),
              _Achievement(icon: Icons.star, label: "Course Starter"),
              _Achievement(icon: Icons.timer, label: "Consistent"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _stat(ThemeData theme, String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.disabledColor,
          ),
        ),
      ],
    );
  }

  Widget _clickableStat(BuildContext context, ThemeData theme, String label, int value) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Clicked on $label")),
        );
      },
      child: _stat(theme, label, value.toString()),
    );
  }

  Widget _currentCourseCard(BuildContext context,
      {required String title, required String description, required double progress}) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: theme.disabledColor.withOpacity(0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.flutter_dash, color: theme.primaryColor, size: 28),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: theme.textTheme.bodySmall?.copyWith(color: theme.disabledColor),
          ),
          const SizedBox(height: 12),
          LinearProgressIndicator(
            value: progress,
            minHeight: 6,
            backgroundColor: theme.disabledColor.withOpacity(0.2),
            color: theme.primaryColor,
            borderRadius: BorderRadius.circular(6),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "${(progress * 100).toInt()}% completed",
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _completedCourseCard(BuildContext context, String title) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: theme.primaryColor.withOpacity(0.08),
      ),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: theme.primaryColor),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          const Text("100%", style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

/// ================= ACHIEVEMENT WIDGET =================
class _Achievement extends StatelessWidget {
  final IconData icon;
  final String label;

  const _Achievement({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: theme.primaryColor.withOpacity(0.12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 28, color: theme.primaryColor),
          const SizedBox(height: 6),
          Text(
            label,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
